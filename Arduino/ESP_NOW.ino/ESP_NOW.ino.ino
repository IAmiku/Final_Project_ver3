#include <esp_now.h>
#include <WiFi.h>

// MPU6050 structure
typedef struct
{

    int16_t Accel_X_RAW;
    int16_t Accel_Y_RAW;
    int16_t Accel_Z_RAW;
    double Ax;
    double Ay;
    double Az;

    int16_t Gyro_X_RAW;
    int16_t Gyro_Y_RAW;
    int16_t Gyro_Z_RAW;
    double Gx;
    double Gy;
    double Gz;

    float Temperature;

    double KalmanAngleX;
    double KalmanAngleY;
} MPU6050_t;
MPU6050_t mpuData;

// uint8_t broadcastAddress[] = {0x54, 0x32, 0x04, 0x41, 0x58, 0xC4};
uint8_t broadcastAddress[] = {0x58, 0xCF, 0x79, 0x07, 0x50, 0xA0};

// Callback when data is received
void OnDataRecv(const uint8_t * mac, const uint8_t *incomingData, int len) {
  Serial.write(incomingData, len);
}

void setup() {
  // neopixelWrite(RGB_BUILTIN,0,0,1); // Blue
  // Initialize Serial Communication
  Serial.begin(500000);

  // Set device as a Wi-Fi Station
  WiFi.mode(WIFI_STA);

  // Init ESP-NOW
  if (esp_now_init() != ESP_OK) {
    return;
  }
  
  // Register peer
  esp_now_peer_info_t peerInfo;
  memcpy(peerInfo.peer_addr, broadcastAddress, 6);
  peerInfo.channel = 0;  
  peerInfo.encrypt = false;
  if (esp_now_add_peer(&peerInfo) != ESP_OK){
    return;
  }

  // Register for a callback function that will be called when data is received
  esp_now_register_recv_cb(OnDataRecv);
}

void loop() {
    static unsigned long lastReceiveTime = 0;
    unsigned long currentTime = millis();
    if (Serial.available() >= sizeof(MPU6050_t)) {
        // Read data into mpuData
        Serial.readBytes((char*)&mpuData, sizeof(MPU6050_t));
        // Send data via ESP-NOW
        esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *)&mpuData, sizeof(mpuData));
        lastReceiveTime = currentTime; // Update the last receive time
        neopixelWrite(RGB_BUILTIN,0,1,0); // Green
    }
    else if (currentTime - lastReceiveTime >= 1000) { // 1000 milliseconds = 1 second
        // Clear the serial buffer
        while(Serial.available() > 0) {
            Serial.read();
        }

        lastReceiveTime = currentTime; // Reset the last receive time
        neopixelWrite(RGB_BUILTIN,1,0,0); // Red
    }
}
