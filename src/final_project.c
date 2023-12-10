#include "cmsis_os.h"

#include "init.h"
#include "mpu6050.h"
#include <math.h>

#include "../Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_lcd.h"
// Defines

#define SQUARE_SIZE 100
#define PI 3.14159265358979323846


// Global Variables
MPU6050_t mpu6050;
MPU6050_t PeerMpu6050;
static double accumulatedAngleX = 0.0f;
static double accumulatedAngleY = 0.0f;
static double accumulatedAngleZ = 0.0f;
static double totalAcc =0.0f;
static double totalAccMem = 1.0f;
//static const double initialVertices[8][3] = {
//    {-SQUARE_SIZE / 2, -SQUARE_SIZE / 2, -SQUARE_SIZE / 2}, // Vertex 0
//    {SQUARE_SIZE / 2, -SQUARE_SIZE / 2, -SQUARE_SIZE / 2},  // Vertex 1
//    {SQUARE_SIZE / 2, SQUARE_SIZE / 2, -SQUARE_SIZE / 2},   // Vertex 2
//    {-SQUARE_SIZE / 2, SQUARE_SIZE / 2, -SQUARE_SIZE / 2},  // Vertex 3
//    {-SQUARE_SIZE / 2, -SQUARE_SIZE / 2, SQUARE_SIZE / 2},  // Vertex 4
//    {SQUARE_SIZE / 2, -SQUARE_SIZE / 2, SQUARE_SIZE / 2},   // Vertex 5
//    {SQUARE_SIZE / 2, SQUARE_SIZE / 2, SQUARE_SIZE / 2},    // Vertex 6
//    {-SQUARE_SIZE / 2, SQUARE_SIZE / 2, SQUARE_SIZE / 2}    // Vertex 7
//};

static const int edges[12][2] = {
     {0, 1}, {1, 2}, {2, 3}, {3, 0}, // Bottom face edges
     {4, 5}, {5, 6}, {6, 7}, {7, 4}, // Top face edges
     {0, 4}, {1, 5}, {2, 6}, {3, 7}  // Side edges
 };

// HAL Handles
I2C_HandleTypeDef hi2c1;
UART_HandleTypeDef DISCO_UART; // USART6
DMA_HandleTypeDef hdma_usart6_tx;
DMA_HandleTypeDef hdma_usart6_rx;
DMA_HandleTypeDef hdma_usart1_tx; // For testing purposes
DMA_HandleTypeDef hdma_usart1_rx;

// Thread Handles
osThreadId_t GyroThreadHandle;
osThreadId_t UART_ThreadHandle;
osThreadId_t LCDBuffer_ThreadHandle;
osThreadId_t LCDRefresh_ThreadHandle;
osThreadId_t PushButton_ThreadHandle;


const osThreadAttr_t Gyro_Thread_attributes = { .name = "Gyro", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 128 * 4 };
const osThreadAttr_t UART_Thread_attributes = { .name = "UART", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 128 * 4 };
const osThreadAttr_t PushButton_Thread_attributes = { .name = "PushButton", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 128 * 4 };
const osThreadAttr_t LCDBuffer_Thread_attributes = { .name = "LCD_Buffer", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 1000 * 4 };
const osThreadAttr_t LCDRefresh_Thread_attributes = { .name = "LCD_Update", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 250 * 4 };
// Queue Handles
osMessageQueueId_t uartQueueHandle;
const osMessageQueueAttr_t uartQueue_attributes = { .name = "mpu6050Queue" };
// Event Handles
osEventFlagsId_t pushButtonFlag;
const osEventFlagsAttr_t pushButton_Event_attributes = { .name = "PushButton",
		.attr_bits = 0, .cb_mem = NULL, .cb_size = 128 * 4 };

// Mutex Handles
osMutexId_t frameBufferMutex; // Mutex to protect the frame buffer
const osMutexAttr_t frameBufferMutex_attributes = {
  .name = "frameBufferMutex"
};
// Timer Handles

// Variables

// Function declarations
void Gyro_Thread(void *argument);
void UART_Thread(void *argument);
void PushButton_Thread(void *argument);
void LCDBuffer_Thread(void *argument);
void LCDRefresh_Thread(void *argument);

void I2C_init();
void UART_init();

int main(void) {
	Sys_Init();
	// Initialize peripherals
	osKernelInitialize();
	// Setup RTOS objects
	GyroThreadHandle = osThreadNew(Gyro_Thread, NULL, &Gyro_Thread_attributes);
	UART_ThreadHandle = osThreadNew(UART_Thread, NULL, &UART_Thread_attributes);
	uartQueueHandle = osMessageQueueNew(1, sizeof(MPU6050_t),
			&uartQueue_attributes); // unused
	const osSemaphoreAttr_t mpuDataSemaphore_attributes = {
	    .name = "mpuDataSemaphore"
	};

	//display
    frameBufferMutex = osMutexNew(&frameBufferMutex_attributes);
    LCDRefresh_ThreadHandle=osThreadNew(LCDRefresh_Thread, NULL, &LCDRefresh_Thread_attributes);

    LCDBuffer_ThreadHandle=osThreadNew(LCDBuffer_Thread, NULL, &LCDBuffer_Thread_attributes);
	PushButton_ThreadHandle = osThreadNew(PushButton_Thread, NULL, &PushButton_Thread_attributes);

	pushButtonFlag = osEventFlagsNew(NULL);	osKernelStart();

	while (1) {
		// We should never get here
	}
}

void USART1_IRQHandler(void) {
	HAL_UART_IRQHandler(&USB_UART);
}
void USART6_IRQHandler(void) {
	HAL_UART_IRQHandler(&DISCO_UART);
}

// UART RX
void DMA2_Stream1_IRQHandler(void) {
	// Call the DMA interrupt handler for the UART RX DMA stream
	HAL_DMA_IRQHandler(&hdma_usart6_rx);
}

// USB RX
void DMA2_Stream5_IRQHandler(void) {
	// Call the DMA interrupt handler for the USB RX DMA stream
	HAL_DMA_IRQHandler(&hdma_usart1_rx);
}
// UART TX
void DMA2_Stream6_IRQHandler(void) {
    // Call the DMA interrupt handler for the UART TX DMA stream
    HAL_DMA_IRQHandler(&hdma_usart6_tx);
}

// USB TX
void DMA2_Stream7_IRQHandler(void) {
    // Call the DMA interrupt handler for the USB TX DMA stream
    HAL_DMA_IRQHandler(&hdma_usart1_tx);
}


void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) {
//	HAL_UART_Receive_IT(&USB_UART, &buffer, 1);
	1;
	if(huart->Instance==USART6){
	    HAL_UART_AbortReceive(&DISCO_UART);// Cancel receiving attempt
		HAL_UART_Receive_DMA(&DISCO_UART, &PeerMpu6050 , sizeof(MPU6050_t));// Get ready to receive Buffer
		osThreadFlagsSet(LCDBuffer_ThreadHandle, 0x00000001U);
	}
}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart) {
// Dont care
}


void I2C_init() {
	GPIO_InitTypeDef gpio_init;
	// I2C initialization
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

void DMA_init() {
	__HAL_RCC_DMA2_CLK_ENABLE();
	////////////////////////////////////////USB UART//////////////////////////////////////////////
	// Configure the DMA stream for USB TX
	hdma_usart1_tx.Instance = DMA2_Stream7;
	hdma_usart1_tx.Init.Channel = DMA_CHANNEL_4;
	hdma_usart1_tx.Init.Direction = DMA_MEMORY_TO_PERIPH;
	hdma_usart1_tx.Init.PeriphInc = DMA_PINC_DISABLE;
	hdma_usart1_tx.Init.MemInc = DMA_MINC_ENABLE;
	hdma_usart1_tx.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
	hdma_usart1_tx.Init.MemDataAlignment = DMA_MDATAALIGN_BYTE;
	hdma_usart1_tx.Init.Mode = DMA_NORMAL;
	hdma_usart1_tx.Init.Priority = DMA_PRIORITY_LOW;
	hdma_usart1_tx.Init.FIFOMode = DMA_FIFOMODE_DISABLE;
	hdma_usart1_tx.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_FULL;
	hdma_usart1_tx.Init.MemBurst = DMA_MBURST_SINGLE;
	hdma_usart1_tx.Init.PeriphBurst = DMA_PBURST_SINGLE;
	// Configure the DMA stream for USB RX
	hdma_usart1_rx.Instance = DMA2_Stream5;
	hdma_usart1_rx.Init.Channel = DMA_CHANNEL_4;
	hdma_usart1_rx.Init.Direction = DMA_PERIPH_TO_MEMORY;
	hdma_usart1_rx.Init.PeriphInc = DMA_PINC_DISABLE;
	hdma_usart1_rx.Init.MemInc = DMA_MINC_ENABLE;
	hdma_usart1_rx.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
	hdma_usart1_rx.Init.MemDataAlignment = DMA_MDATAALIGN_BYTE;
	hdma_usart1_rx.Init.Mode = DMA_NORMAL;
	hdma_usart1_rx.Init.Priority = DMA_PRIORITY_HIGH;
	hdma_usart1_rx.Init.FIFOMode = DMA_FIFOMODE_DISABLE;
	hdma_usart1_rx.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_FULL;
	hdma_usart1_rx.Init.MemBurst = DMA_MBURST_SINGLE;
	hdma_usart1_rx.Init.PeriphBurst = DMA_PBURST_SINGLE;
	////////////////////////////////////////BOARD UART//////////////////////////////////////////////
	// Configure the DMA stream for UART TX
	hdma_usart6_tx.Instance = DMA2_Stream6;
	hdma_usart6_tx.Init.Channel = DMA_CHANNEL_5;
	hdma_usart6_tx.Init.Direction = DMA_MEMORY_TO_PERIPH;
	hdma_usart6_tx.Init.PeriphInc = DMA_PINC_DISABLE;
	hdma_usart6_tx.Init.MemInc = DMA_MINC_ENABLE;
	hdma_usart6_tx.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
	hdma_usart6_tx.Init.MemDataAlignment = DMA_MDATAALIGN_BYTE;
	hdma_usart6_tx.Init.Mode = DMA_NORMAL;
	hdma_usart6_tx.Init.Priority = DMA_PRIORITY_LOW;
	hdma_usart6_tx.Init.FIFOMode = DMA_FIFOMODE_DISABLE;
	hdma_usart6_tx.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_FULL;
	hdma_usart6_tx.Init.MemBurst = DMA_MBURST_INC16;
	hdma_usart6_tx.Init.PeriphBurst = DMA_PBURST_INC16;
	// Configure the DMA stream for UART RX
	hdma_usart6_rx.Instance = DMA2_Stream1;
	hdma_usart6_rx.Init.Channel = DMA_CHANNEL_5;
	hdma_usart6_rx.Init.Direction = DMA_PERIPH_TO_MEMORY;
	hdma_usart6_rx.Init.PeriphInc = DMA_PINC_DISABLE;
	hdma_usart6_rx.Init.MemInc = DMA_MINC_ENABLE;
	hdma_usart6_rx.Init.PeriphDataAlignment = DMA_PDATAALIGN_BYTE;
	hdma_usart6_rx.Init.MemDataAlignment = DMA_MDATAALIGN_BYTE;
	hdma_usart6_rx.Init.Mode = DMA_NORMAL;
	hdma_usart6_rx.Init.Priority = DMA_PRIORITY_HIGH;
	hdma_usart6_rx.Init.FIFOMode = DMA_FIFOMODE_DISABLE;
	hdma_usart6_rx.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_FULL;
	hdma_usart6_rx.Init.MemBurst = DMA_MBURST_INC16;
	hdma_usart6_rx.Init.PeriphBurst = DMA_PBURST_INC16;

	////////////////////////////////////////ENABLE DMA INTRRUPT//////////////////////////////////////////////
	HAL_NVIC_EnableIRQ(DMA2_Stream1_IRQn);    // UART RX
    HAL_NVIC_SetPriority(DMA2_Stream1_IRQn, 6, 0);
	HAL_NVIC_EnableIRQ(DMA2_Stream5_IRQn);    // USB RX
    HAL_NVIC_SetPriority(DMA2_Stream5_IRQn, 6, 1);
	HAL_NVIC_EnableIRQ(DMA2_Stream6_IRQn);    // UART TX
    HAL_NVIC_SetPriority(DMA2_Stream6_IRQn, 6, 2);
	HAL_NVIC_EnableIRQ(DMA2_Stream7_IRQn);    // USB TX
    HAL_NVIC_SetPriority(DMA2_Stream7_IRQn, 6, 3);

	// Init both DMA
	HAL_DMA_Init(&hdma_usart1_rx);
	HAL_DMA_Init(&hdma_usart1_tx);
	HAL_DMA_Init(&hdma_usart6_rx);
	HAL_DMA_Init(&hdma_usart6_tx);
	// Associate DMA handler to the UART handler
	__HAL_LINKDMA(&USB_UART, hdmatx, hdma_usart1_tx);
	__HAL_LINKDMA(&USB_UART, hdmarx, hdma_usart1_rx);
	__HAL_LINKDMA(&DISCO_UART, hdmatx, hdma_usart6_tx);
	__HAL_LINKDMA(&DISCO_UART, hdmarx, hdma_usart6_rx);
}

void UART_init() {

	UART_HandleTypeDef *USB_UART_ptr = &USB_UART;		// For USB
	UART_HandleTypeDef *DISCO_UART_ptr = &DISCO_UART;	// For Disco board

	USB_UART_ptr->Instance = USART1;
	USB_UART_ptr->Init.BaudRate = 115200;
	USB_UART_ptr->Init.WordLength = UART_WORDLENGTH_8B;
	USB_UART_ptr->Init.StopBits = UART_STOPBITS_1;
	USB_UART_ptr->Init.Parity = UART_PARITY_NONE;
	USB_UART_ptr->Init.Mode = UART_MODE_TX_RX;
	USB_UART_ptr->Init.HwFlowCtl = UART_HWCONTROL_NONE;
	HAL_UART_Init(&USB_UART);
    // Configure the NVIC for UART interrupts
    HAL_NVIC_SetPriority(USART1_IRQn, 5, 0);
    HAL_NVIC_EnableIRQ(USART1_IRQn);

	DISCO_UART_ptr->Instance = USART6;
	DISCO_UART_ptr->Init.BaudRate = 500000;
	DISCO_UART_ptr->Init.WordLength = UART_WORDLENGTH_8B;
	DISCO_UART_ptr->Init.StopBits = UART_STOPBITS_1;
	DISCO_UART_ptr->Init.Parity = UART_PARITY_NONE;
	DISCO_UART_ptr->Init.Mode = UART_MODE_TX_RX;
	DISCO_UART_ptr->Init.HwFlowCtl = UART_HWCONTROL_NONE;

	HAL_UART_Init(&DISCO_UART);
    // Configure the NVIC for UART interrupts
    HAL_NVIC_SetPriority(USART6_IRQn, 5, 2);
	HAL_NVIC_EnableIRQ(USART6_IRQn);
	//GPIO INIT IN UART
}

void Gyro_Thread(void *argument) {
	I2C_init();
	MPU6050_Init(&hi2c1);
	uint8_t message [100];
//	//RTOS precise time control
//  TickType_t xLastWakeTime;
//  const TickType_t xFrequency = pdMS_TO_TICKS(20);
	osDelay(100);
	while(1) {
		MPU6050_Read_All(&hi2c1, &mpu6050);
		HAL_UART_AbortTransmit(&DISCO_UART);// DMA bug
		HAL_UART_Transmit_DMA(&DISCO_UART, &mpu6050, sizeof(MPU6050_t));
//		vTaskDelayUntil(&xLastWakeTime, xFrequency);
		osDelay(20);
	}
}

void UART_Thread(void *argument) {
	DMA_init();
	UART_init();
	while (1) {
		osDelay(100);
	}
}

void LCDBuffer_Thread(void *argument){
	HAL_UART_Receive_DMA(&DISCO_UART, &PeerMpu6050 , sizeof(MPU6050_t));// Get ready to receive Buffer
	// ensure that the LCD is initialized
	osDelay(1000);
    uint32_t frameBufferWidth = BSP_LCD_GetXSize();
    uint32_t frameBufferHeight = BSP_LCD_GetYSize();

    while(1) {
		osThreadFlagsWait(0x00000001U, osFlagsWaitAny, osWaitForever); // Wait for new MPU6050 data

		osMutexAcquire(frameBufferMutex, osWaitForever);

    	char text[60] = "  G X |  G Y |  G Z |  A X |  A Y |  A Z";
//    	BSP_LCD_DisplayStringAt(0,0,text,0x03);	// BSP error example
    	DrawStringToBuffer(text, 0, 0, 0xFFFFFF00, (uint8_t*)LCD_FB_START_ADDRESS, BSP_LCD_GetXSize());
        static char mpu_data[60]={0};
        DrawStringToBuffer(mpu_data, 0, 24, 0xFFFF00FF, (uint8_t*)LCD_FB_START_ADDRESS, BSP_LCD_GetXSize());
        sprintf(mpu_data, "%6.2f %6.2f %6.2f %6.2f %6.2f %6.2f",
                (double)PeerMpu6050.Gx, (double)PeerMpu6050.Gy, (double)PeerMpu6050.Gz,
                (double)PeerMpu6050.Ax, (double)PeerMpu6050.Ay, (double)PeerMpu6050.Az);
        DrawStringToBuffer(mpu_data, 0, 24, 0xFFFFFF00, (uint8_t*)LCD_FB_START_ADDRESS, BSP_LCD_GetXSize());


        // Copy initial vertices and apply accumulated rotations
        static double transformedVertices[8][3];
        static char points[80] = {0};
        static char accumulated[60] = {0};
      //Clear printed vertices on the screen
      DrawStringToBuffer(points, 0, 24 * 5, 0xFFFF00FF, (uint8_t*)LCD_FB_START_ADDRESS, BSP_LCD_GetXSize());

		// erase cube
        for (int i = 0; i < 12; i++) {
            int startVertex = edges[i][0];
            int endVertex = edges[i][1];
            DrawLineInBuffer((uint16_t)transformedVertices[startVertex][0], (uint16_t)transformedVertices[startVertex][1],
                             (uint16_t)transformedVertices[endVertex][0], (uint16_t)transformedVertices[endVertex][1],
                             0xFFFF00FF, (uint32_t*)LCD_FB_START_ADDRESS, BSP_LCD_GetXSize());
        }
        totalAccMem = 0.7*totalAccMem+0.3*totalAcc;
        double side = SQUARE_SIZE*(totalAccMem);

        // New cube
		transformedVertices[0][0] = -side / 2; transformedVertices[0][1] = -side / 2; transformedVertices[0][2] = -side / 2; // Vertex 0
		transformedVertices[1][0] = side / 2;  transformedVertices[1][1] = -side / 2; transformedVertices[1][2] = -side / 2; // Vertex 1
		transformedVertices[2][0] = side / 2;  transformedVertices[2][1] = side / 2;  transformedVertices[2][2] = -side / 2; // Vertex 2
		transformedVertices[3][0] = -side / 2; transformedVertices[3][1] = side / 2;  transformedVertices[3][2] = -side / 2; // Vertex 3
		transformedVertices[4][0] = -side / 2; transformedVertices[4][1] = -side / 2; transformedVertices[4][2] = side / 2;  // Vertex 4
		transformedVertices[5][0] = side / 2;  transformedVertices[5][1] = -side / 2; transformedVertices[5][2] = side / 2;  // Vertex 5
		transformedVertices[6][0] = side / 2;  transformedVertices[6][1] = side / 2;  transformedVertices[6][2] = side / 2;  // Vertex 6
		transformedVertices[7][0] = -side / 2; transformedVertices[7][1] = side / 2;  transformedVertices[7][2] = side / 2;  // Vertex 7

        // Update accumulated angles
        double deltaT = 0.03;
        // Update and normalize the accumulated angles
        if(PeerMpu6050.Gx>0.1||PeerMpu6050.Gx<0.1)
        {
        accumulatedAngleX = accumulatedAngleX + PeerMpu6050.Gx * deltaT;
        normalizeAngle(&accumulatedAngleX);
    		}
        if(PeerMpu6050.Gy>0.1||PeerMpu6050.Gy<0.1)
        {
        accumulatedAngleY = accumulatedAngleY + PeerMpu6050.Gy * deltaT;
        normalizeAngle(&accumulatedAngleY);
    		}
        if(PeerMpu6050.Gz>0.1||PeerMpu6050.Gy<0.1)
        {
        accumulatedAngleZ = accumulatedAngleZ + PeerMpu6050.Gz * deltaT;
        normalizeAngle(&accumulatedAngleZ);
        }
        totalAcc=sqrt(PeerMpu6050.Ax + sqrt( PeerMpu6050.Ay*PeerMpu6050.Ay+PeerMpu6050.Az*PeerMpu6050.Az));
        accumulatedAngleX=accumulatedAngleX+0.2;
        accumulatedAngleY=accumulatedAngleY+0.2;
        accumulatedAngleZ=accumulatedAngleZ+0.2;



        rotate(transformedVertices, accumulatedAngleX, accumulatedAngleY, accumulatedAngleZ);



        // Project 3D points to 2D and draw
        uint32_t centerX = BSP_LCD_GetXSize() / 2;
        uint32_t centerY = BSP_LCD_GetYSize() / 2;

        for (int i = 0; i < 8; i++) {
            transformedVertices[i][0] += centerX;
            transformedVertices[i][1] += centerY;
        }

		// Draw the transformed square


        for (int i = 0; i < 12; i++) {
            int startVertex = edges[i][0];
            int endVertex = edges[i][1];
            DrawLineInBuffer((uint16_t)transformedVertices[startVertex][0], (uint16_t)transformedVertices[startVertex][1],
                             (uint16_t)transformedVertices[endVertex][0], (uint16_t)transformedVertices[endVertex][1],
                             0xFFFFFF00, (uint32_t*)LCD_FB_START_ADDRESS, BSP_LCD_GetXSize());
        }

		//Print vertices on the screen
        sprintf(points, "%4.0f %4.0f|%4.0f %4.0f|%4.0f %4.0f|%4.0f %4.0f|%4.0f %4.0f|%4.0f %4.0f|%4.0f %4.0f|%4.0f %4.0f",
        		transformedVertices[0][0] - centerX, transformedVertices[0][1] - centerY,
				transformedVertices[1][0] - centerX, transformedVertices[1][1] - centerY,
				transformedVertices[2][0] - centerX, transformedVertices[2][1] - centerY,
				transformedVertices[3][0] - centerX, transformedVertices[3][1] - centerY,
        		transformedVertices[4][0] - centerX, transformedVertices[4][1] - centerY,
				transformedVertices[5][0] - centerX, transformedVertices[5][1] - centerY,
				transformedVertices[6][0] - centerX, transformedVertices[6][1] - centerY,
				transformedVertices[7][0] - centerX, transformedVertices[7][1] - centerY);
        DrawStringToBuffer(points, 0, 24 * 5, 0xFFFFFF00, (uint8_t*)LCD_FB_START_ADDRESS, BSP_LCD_GetXSize());

        DrawStringToBuffer(accumulated, 0, 24 * 15, 0xFFFF00FF, (uint8_t*)LCD_FB_START_ADDRESS, BSP_LCD_GetXSize());
        sprintf(accumulated, "Accum X: %.2f Y: %.2f Z: %.2f cosx: %.2f",
        		accumulatedAngleX,
				accumulatedAngleY,
				accumulatedAngleZ,
				cos(accumulatedAngleX*M_PI/180));
        DrawStringToBuffer(accumulated, 0, 24*15, 0xFFFFFF00, (uint8_t*)LCD_FB_START_ADDRESS, BSP_LCD_GetXSize());

//        DrawRotatingCube(&PeerMpu6050, (uint32_t*)LCD_FB_START_ADDRESS, BSP_LCD_GetXSize(), BSP_LCD_GetYSize());

        osMutexRelease(frameBufferMutex);
    }
}

void LCDRefresh_Thread(void *argument) {
	// Initlize LCD
	BSP_LCD_Init();
	BSP_LCD_LayerDefaultInit(0,LCD_FB_START_ADDRESS);
	BSP_LCD_SelectLayer(0);
	BSP_LCD_DisplayOn();
	BSP_LCD_Clear(LCD_COLOR_WHITE);

	uint32_t color = 0xFFFF00FF;
	uint32_t frameBufferWidth = BSP_LCD_GetXSize();
	uint32_t frameBufferHeight = BSP_LCD_GetYSize();
	// Clear the screen by writing directly into memoery
	for (uint32_t y = 0; y < frameBufferHeight; y++) {
	    for (uint32_t x = 0; x < frameBufferWidth; x++) {
	    	((uint32_t*)LCD_FB_START_ADDRESS)[y * frameBufferWidth + x] = color;
	    }
	}

    while (1) {
//    	//Failed attemp to use double fram buffer
//    	osMutexAcquire(frameBufferMutex, osWaitForever);
//
////    	BSP_LCD_DrawBitmap(0, 0, (uint8_t *)LCD_FB_START_ADDRESS);
//
//
////    	BSP_LCD_DrawCircle(1,1,1);
//		osMutexRelease(frameBufferMutex);
		osDelay(1000); // 25Hz

    }

}

void DrawStringToBuffer(char* str, uint16_t x, uint16_t y, uint32_t textColor, uint32_t* buffer, uint32_t bufferWidth) {
    sFONT *pFont = BSP_LCD_GetFont(); // Get the current font
    uint16_t charWidth = pFont->Width;
    uint16_t charHeight = pFont->Height;
    while (*str) {
        if (*str < ' ' || *str > '~') {
            str++;
            continue; // Skip non-printable characters
        }

        uint8_t *charBitmap = &pFont->table[(*str - ' ') * charHeight * ((charWidth + 7) / 8)];
        DrawCharToBuffer(x, y, charBitmap, charWidth, charHeight, textColor,  buffer, bufferWidth);

        x += charWidth; // Move to the next character position
        if (x + charWidth > bufferWidth) {
            x = 0; // Reset x to start of next line
            y += charHeight;
        }
        str++;
    }
}

void DrawCharToBuffer(uint16_t x, uint16_t y, uint8_t* charBitmap,
						uint16_t charWidth, uint16_t charHeight,
						uint32_t textColor,  uint32_t* buffer, uint32_t bufferWidth) {
    for (uint16_t i = 0; i < charHeight; i++) {
        for (uint16_t j = 0; j < charWidth; j++) {
            uint16_t bit = (charBitmap[i * ((charWidth + 7) / 8) + j / 8] >> (7 - j % 8)) & 0x1;
            if(!bit)continue;// Skip non bit
            uint32_t color = textColor;
            uint32_t *pixel = buffer + (y + i) * bufferWidth + (x + j);
            if ((x + j) < bufferWidth) {
                *pixel = color;
            }
        }
    }
}
// Convert degrees to radians
double toRadians(double degrees) {
    return degrees * (PI / 180.0);
}


void DrawLineInBuffer(uint16_t x0, uint16_t y0, uint16_t x1, uint16_t y1, uint32_t color, uint32_t* buffer, uint32_t bufferWidth) {
    int dx = abs(x1 - x0), sx = x0 < x1 ? 1 : -1;
    int dy = -abs(y1 - y0), sy = y0 < y1 ? 1 : -1;
    int err = dx + dy, e2;

    while (1) {
        if (x0 >= 0 && x0 < bufferWidth && y0 >= 0 && y0 < bufferWidth) {
            buffer[y0 * bufferWidth + x0] = color;
        }
        if (x0 == x1 && y0 == y1) break;
        e2 = 2 * err;
        if (e2 >= dy) { err += dy; x0 += sx; }
        if (e2 <= dx) { err += dx; y0 += sy; }
    }
}

void rotateVertex(double vertex[3], double sinX, double cosX, double sinY, double cosY, double sinZ, double cosZ) {
    // Original coordinates
    double x = vertex[0];
    double y = vertex[1];
    double z = vertex[2];

    // Rotate around X-axis
    double newY = y * cosX - z * sinX;
    double newZ = y * sinX + z * cosX;

    // Rotate around Y-axis
    double newX = x * cosY + newZ * sinY;
    newZ = -x * sinY + newZ * cosY;

    // Rotate around Z-axis
    x = newX * cosZ - newY * sinZ;
    y = newX * sinZ + newY * cosZ;

    // Update vertex coordinates
    vertex[0] = x;
    vertex[1] = y;
    vertex[2] = newZ;
}

void rotate(double matrix[8][3], double angleX, double angleY, double angleZ) {
    // Convert angles from degrees to radians
    double radX = angleX * M_PI / 180.0;
    double radY = angleY * M_PI / 180.0;
    double radZ = angleZ * M_PI / 180.0;

    // Compute sin and cos for each angle
    double sinX = sin(radX);
    double cosX = cos(radX);
    double sinY = sin(radY);
    double cosY = cos(radY);
    double sinZ = sin(radZ);
    double cosZ = cos(radZ);

    for (int i = 0; i < 8; i++) {
        rotateVertex(matrix[i], sinX, cosX, sinY, cosY, sinZ, cosZ);
    }
}

// Normalize angles to the range [0, 360]
void normalizeAngle(double* angle) {
    while (*angle >= 360.0f) *angle -= 360.0f;
    while (*angle < 0.0f) *angle += 360.0f;
}


void PushButton_Thread(void *argument) {
	// PA0 button init
	GPIO_InitTypeDef GPIO_InitStruct = { .Pin = GPIO_PIN_0, .Mode =
			GPIO_MODE_IT_RISING_FALLING, .Pull = GPIO_NOPULL };
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);
	HAL_NVIC_EnableIRQ(EXTI0_IRQn);    // UART RX
    HAL_NVIC_SetPriority(EXTI0_IRQn, 7, 0);
	while(1){
		osDelay(10000);
	}
}

void EXTI0_IRQHandler(void) {
	// When External interrupt 0 happened
	// Set flag here [EVENT]
	__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_0);  // Clear the interrupt flag
	osEventFlagsSet(pushButtonFlag, 0x00000001U);
	accumulatedAngleX = 0;
	accumulatedAngleY = 0;
	accumulatedAngleZ = 0;
}

void HAL_Delay( uint32_t ulDelayMs )
{
    vTaskDelay(ulDelayMs);
}
