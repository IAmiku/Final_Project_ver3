#include "cmsis_os.h"

#include "init.h"
#include "mpu6050.h"

#include "../Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_lcd.h"
// Defines


// Global Variables
MPU6050_t mpu6050;
MPU6050_t PeerMpu6050;


// HAL Handles
I2C_HandleTypeDef hi2c1;
UART_HandleTypeDef DISCO_UART; // USART6
DMA_HandleTypeDef hdma_usart6_tx;
DMA_HandleTypeDef hdma_usart6_rx;
DMA_HandleTypeDef hdma_usart1_tx; // For testing purporses
DMA_HandleTypeDef hdma_usart1_rx;

// Thread Handles
osThreadId_t GyroThreadHandle;
osThreadId_t UART_ThreadHandle;
osThreadId_t LCD_ThreadHandle;

const osThreadAttr_t Gyro_Thread_attributes = { .name = "Gyro", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 128 * 4 };
const osThreadAttr_t UART_Thread_attributes = { .name = "UART", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 128 * 4 };
const osThreadAttr_t LCD_Thread_attributes = { .name = "LCD", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 500 * 4 };
// Queue Handles
osMessageQueueId_t uartQueueHandle;
const osMessageQueueAttr_t uartQueue_attributes = { .name = "mpu6050Queue" };
// Event Handles
// Mutex Handles
// Timer Handles

// Variables

// Function declarations
void Gyro_Thread(void *argument);
void UART_Thread(void *argument);
void LCD_Thread(void *argument);

void I2C_init();
void UART_init();

int main(void) {
	Sys_Init();

//	HAL_NVIC_SetPriority(SysTick_IRQn, 0,1);

	// Initialize peripherals
	osKernelInitialize();
	// Setup RTOS objects
	GyroThreadHandle = osThreadNew(Gyro_Thread, NULL, &Gyro_Thread_attributes);
	UART_ThreadHandle = osThreadNew(UART_Thread, NULL, &UART_Thread_attributes);
	uartQueueHandle = osMessageQueueNew(1, sizeof(MPU6050_t),
			&uartQueue_attributes); // unused
	LCD_ThreadHandle = osThreadNew(LCD_Thread, NULL, &LCD_Thread_attributes );

	osKernelStart();

	while (1) {
		// We should never get here
	}
}

void USART1_IRQHandler(void) {
	HAL_UART_IRQHandler(&USB_UART);
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
}

void HAL_UART_TxCpltCallback(UART_HandleTypeDef *huart) {
// Dont care
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
	hdma_usart1_tx.Init.FIFOMode = DMA_FIFOMODE_ENABLE;
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
	hdma_usart1_rx.Init.FIFOMode = DMA_FIFOMODE_ENABLE;
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
	hdma_usart6_tx.Init.FIFOMode = DMA_FIFOMODE_ENABLE;
	hdma_usart6_tx.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_FULL;
	hdma_usart6_tx.Init.MemBurst = DMA_MBURST_SINGLE;
	hdma_usart6_tx.Init.PeriphBurst = DMA_PBURST_SINGLE;
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
	hdma_usart6_rx.Init.FIFOMode = DMA_FIFOMODE_ENABLE;
	hdma_usart6_rx.Init.FIFOThreshold = DMA_FIFO_THRESHOLD_FULL;
	hdma_usart6_rx.Init.MemBurst = DMA_MBURST_SINGLE;
	hdma_usart6_rx.Init.PeriphBurst = DMA_PBURST_SINGLE;

	////////////////////////////////////////ENABLE DMA INTRRUPT//////////////////////////////////////////////
	HAL_NVIC_EnableIRQ(DMA2_Stream1_IRQn);    // UART RX
	HAL_NVIC_EnableIRQ(DMA2_Stream5_IRQn);    // USB RX

	HAL_NVIC_EnableIRQ(DMA2_Stream6_IRQn);    // UART TX
	HAL_NVIC_EnableIRQ(DMA2_Stream7_IRQn);    // USB TX

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
	DISCO_UART_ptr->Init.BaudRate = 38400;
	DISCO_UART_ptr->Init.WordLength = UART_WORDLENGTH_8B;
	DISCO_UART_ptr->Init.StopBits = UART_STOPBITS_1;
	DISCO_UART_ptr->Init.Parity = UART_PARITY_NONE;
	DISCO_UART_ptr->Init.Mode = UART_MODE_TX_RX;
	DISCO_UART_ptr->Init.HwFlowCtl = UART_HWCONTROL_NONE;

	HAL_UART_Init(&DISCO_UART);
    // Configure the NVIC for UART interrupts
    HAL_NVIC_SetPriority(USART6_IRQn, 5, 1);
	HAL_NVIC_EnableIRQ(USART6_IRQn);

	GPIO_InitTypeDef  GPIO_InitStruct;
	// Enable GPIO Clocks
	__GPIOA_CLK_ENABLE();
	// Initialize TX Pin
	GPIO_InitStruct.Pin       = GPIO_PIN_9;
	GPIO_InitStruct.Mode      = GPIO_MODE_AF_PP;
	GPIO_InitStruct.Pull      = GPIO_PULLUP;
	GPIO_InitStruct.Speed     = GPIO_SPEED_HIGH;
	GPIO_InitStruct.Alternate = GPIO_AF7_USART1;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct); //TX Config
	// Initialize RX Pin
	GPIO_InitStruct.Pin = GPIO_PIN_10;
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct); //RX Config
	// Enable UART Clocking
	__USART1_CLK_ENABLE();

	// Enable GPIO Clocks
	__GPIOC_CLK_ENABLE();
	// Initialize TX Pin
	GPIO_InitStruct.Pin       = GPIO_PIN_6;
	GPIO_InitStruct.Mode      = GPIO_MODE_AF_PP;
	GPIO_InitStruct.Pull      = GPIO_PULLUP;
	GPIO_InitStruct.Speed     = GPIO_SPEED_HIGH;
	GPIO_InitStruct.Alternate = GPIO_AF8_USART6;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct); //TX Config
	// Initialize RX Pin
	GPIO_InitStruct.Pin = GPIO_PIN_7;
	HAL_GPIO_Init(GPIOC, &GPIO_InitStruct); //RX Config
	// Enable UART Clocking
	__USART6_CLK_ENABLE();
}

void Gyro_Thread(void *argument) {
	I2C_init();
	MPU6050_Init(&hi2c1);
	uint8_t message [100];
//    TickType_t xLastWakeTime;
//    const TickType_t xFrequency = pdMS_TO_TICKS(1000);
	osDelay(1000);
	while(1) {
		MPU6050_Read_All(&hi2c1, &mpu6050);

		/*
		int16_t acc_x = (int16_t) mpu6050.Ax;
		int16_t acc_y = (int16_t) mpu6050.Ay;
		int16_t acc_z = (int16_t) mpu6050.Az;

		int16_t gyro_x = (int16_t) mpu6050.Gx; //Kalman_getAngle(&kalman, mpu6050.Gx, mpu6050.Ax, );
		int16_t gyro_y = (int16_t) mpu6050.Gy;
		int16_t gyro_z = (int16_t) mpu6050.Gz;

		int16_t ang_x = (int16_t) mpu6050.KalmanAngleX;
		int16_t ang_y = (int16_t) mpu6050.KalmanAngleY;// NOT WORKING

		int16_t temperature = (int16_t) mpu6050.Temperature;

		sprintf(message,"\033[0m\033[44;33m\033[2J\033[;H"
				"Accelerometer X is %d, Y is %d, Z is %d \n\r"
				"Gyro X is %d, Y is %d, Z is %d \n\r"
				"Temperature: %d\n\r"
				"KalmanX: %d  KalmanY %d",
				acc_x, acc_y, acc_z,
				gyro_x, gyro_y, gyro_z,
				temperature, ang_x, ang_y);


		HAL_UART_Transmit_IT(&USB_UART, message,strlen(message));
				*/

		HAL_UART_Transmit_DMA(&USB_UART, &mpu6050, sizeof(MPU6050_t));

//		vTaskDelayUntil(&xLastWakeTime, xFrequency);// TODO: fix later
		osDelay(10);
	}
}

void UART_Thread(void *argument) {
	DMA_init();
	UART_init();

	while (1) {

	}
}
void LCD_Thread(void *argument){
	BSP_LCD_Init();
	BSP_LCD_LayerDefaultInit(0,LCD_FB_START_ADDRESS);
	BSP_LCD_SelectLayer(0);
	BSP_LCD_DisplayOn();
	BSP_LCD_Clear(LCD_COLOR_RED);

	BSP_LCD_SetTextColor(LCD_COLOR_DARKGRAY);
	char* text = "Hello World!";
	BSP_LCD_DisplayStringAtLine(0, (uint8_t *)text);
	while(1){

	}
}


void HAL_Delay( uint32_t ulDelayMs )
{
    vTaskDelay(ulDelayMs);
}
