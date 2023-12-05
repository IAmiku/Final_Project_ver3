#include "cmsis_os.h"

#include "init.h"
#include "mpu6050.h"
// Defines


// Global Variables
MPU6050_t mpu6050;
I2C_HandleTypeDef hi2c1;

// HAL Handles
// Thread Handles
osThreadId_t GyroThreadHandle;
osThreadId_t UART_ThreadHandle;

const osThreadAttr_t Gyro_Thread_attributes = { .name = "Gyro", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 128 * 4 };
const osThreadAttr_t UART_Thread_attributes = { .name = "UART", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 500 * 4 };
// Queue Handles
// Event Handles
// Mutex Handles
// Timer Handles

// Variables

// Function declarations
void Gyro_Thread(void *argument);
void UART_Thread(void *argument);

void I2C_init();
void UART_init();

int main(void) {
	Sys_Init();

	// Initialize peripherals

	osKernelInitialize();

	// Setup RTOS objects
	GyroThreadHandle = osThreadNew(Gyro_Thread, NULL, &Gyro_Thread_attributes);
	UART_ThreadHandle = osThreadNew(UART_Thread, NULL, &UART_Thread_attributes);

	osKernelStart();

	while (1) {
		// We should never get here
	}
}

void USART1_IRQHandler(void) {
	HAL_UART_IRQHandler(&USB_UART);
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) {
//	HAL_UART_Receive_IT(&USB_UART, &buffer, 1);
}

void I2C_init() {
	GPIO_InitTypeDef gpio_init;

	hi2c1.Instance = I2C1;
	hi2c1.Init.Timing = 0x00506682;
	hi2c1.Init.OwnAddress1 = 0;
	hi2c1.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
	hi2c1.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
	hi2c1.Init.OwnAddress2 = 0;
	hi2c1.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
	hi2c1.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
	hi2c1.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
	if (HAL_I2C_Init(&hi2c1) != HAL_OK)
	{
		printf("I2C init failed\n\r");
	}
	if (HAL_I2CEx_ConfigAnalogFilter(&hi2c1, I2C_ANALOGFILTER_ENABLE) != HAL_OK)
	{
		printf("I2C analog filter init failed\n\r");
	}

	/** Configure Digital filter
	*/
	if (HAL_I2CEx_ConfigDigitalFilter(&hi2c1, 0) != HAL_OK)
	{
		printf("I2C digital filter init failed\n\r");
	}

	gpio_init.Pin = GPIO_PIN_8 | GPIO_PIN_9;
	gpio_init.Mode = GPIO_MODE_AF_OD;
	gpio_init.Pull = GPIO_PULLUP;
	gpio_init.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
	gpio_init.Alternate = GPIO_AF4_I2C1;
	HAL_GPIO_Init(GPIOB, &gpio_init);
}

void UART_init() {
	UART_HandleTypeDef *USB_UART_ptr = &USB_UART;

	USB_UART_ptr->Instance = USART1;
	USB_UART_ptr->Init.BaudRate = 115200;
	USB_UART_ptr->Init.WordLength = UART_WORDLENGTH_8B;
	USB_UART_ptr->Init.StopBits = UART_STOPBITS_1;
	USB_UART_ptr->Init.Parity = UART_PARITY_NONE;
	USB_UART_ptr->Init.Mode = UART_MODE_TX_RX;
	USB_UART_ptr->Init.HwFlowCtl = UART_HWCONTROL_NONE;
	HAL_UART_Init(&USB_UART);
}

void Gyro_Thread(void *argument) {
	void I2C_init();

	uint8_t init_status = MPU6050_Init(&hi2c1);

	while(1) {
//		HAL_Delay(100);
		osDelay(100);
		MPU6050_Read_Accel(&hi2c1, &mpu6050);
		uint16_t acc_x = (uint16_t) mpu6050.Ax;
		uint16_t acc_y = (uint16_t) mpu6050.Ay;
		uint16_t acc_z = (uint16_t) mpu6050.Az;
//		printf("Accelerometer X is %d, Y is %d, Z is %d \n\r", acc_x, acc_y, acc_z);
		MPU6050_Read_Gyro(&hi2c1, &mpu6050);

		uint16_t gyro_x = (uint16_t) mpu6050.Gx; //Kalman_getAngle(&kalman, mpu6050.Gx, mpu6050.Ax, );
		uint16_t gyro_y = (uint16_t) mpu6050.Gy;
		uint16_t gyro_z = (uint16_t) mpu6050.Gz;
//		printf("Gyro X is %d, Y is %d, Z is %d \n\r", gyro_x, gyro_y, gyro_z);
	}
}

void UART_Thread(void *argument) {
	UART_init();
	while (1) {
	}
}
