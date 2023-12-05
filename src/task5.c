#include "cmsis_os.h"

#include "init.h"

// Defines


// Global Variables
uint8_t buffer;
osStatus_t status;

// HAL Handles
// Thread Handles
osThreadId_t LED1ThreadHandle;
osThreadId_t LED2ThreadHandle;
osThreadId_t LED3ThreadHandle;
osThreadId_t TimerThreadHandle;
osThreadId_t LED1ERRORThreadHandle;
osThreadId_t UART_ThreadHandle;

const osThreadAttr_t LED1_Thread_attributes = { .name = "LED1", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 128 * 4 };
const osThreadAttr_t LED2_Thread_attributes = { .name = "LED2", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 128 * 4 };
const osThreadAttr_t LED3_Thread_attributes = { .name = "LED3", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 128 * 4 };
const osThreadAttr_t Timer_Thread_attributes = { .name = "Timer1Thread",
		.priority = (osPriority_t) osPriorityNormal, .stack_size = 128 * 4 };
const osThreadAttr_t LED1_ERROR_Thread_attributes = { .name = "LED1ERROR",
		.priority = (osPriority_t) osPriorityHigh, .stack_size = 128 * 4 };
const osThreadAttr_t UART_Thread_attributes = { .name = "UART", .priority =
		(osPriority_t) osPriorityNormal, .stack_size = 500 * 4 };
// Queue Handles
osMessageQueueId_t uartQueueHandle;
const osMessageQueueAttr_t uartQueue_attributes = { .name = "uartQueue" };
// Event Handles
osEventFlagsId_t pushButtonFlag;
const osEventFlagsAttr_t pushButton_Event_attributes = { .name = "PushButton",
		.attr_bits = 0, .cb_mem = NULL, .cb_size = 128 * 4 };
// Mutex Handles
osMutexId_t LED1Mutex;
const osMutexAttr_t Thread_Mutex_attr = { "LED1Mutex", // human readable mutex name
		osMutexRobust | osMutexPrioInherit,       // attr_bits
		NULL,                // memory for control block
		0U                   // size for control block
		};
// Timer Handles
osTimerId_t tim1_handle;
const osTimerAttr_t tim1_attributes = { .name = "Timer1", .attr_bits = 0,
		.cb_mem = NULL, .cb_size = 0 };

// Variables

// Function declarations
void LED1_Thread(void *argument);
void LED2_Thread(void *argument);
void LED3_Thread(void *argument);
void UART_Thread(void *argument);
void Timer_Thread(void *argument);
void LED1_ERROR_Thread(void *argument);

void GPIO_Init();
void UART_init();

void timerCallback();

int main(void) {
	Sys_Init();

	// Initialize peripherals
	GPIO_Init();

	// WARNING! printf support will not work in task 1
//    printf("\033[2J\033[;H");
//    fflush(stdout);// Erase screen & move cursor to home position

	osKernelInitialize();

	// Setup RTOS objects
	LED1ThreadHandle = osThreadNew(LED1_Thread, NULL, &LED1_Thread_attributes);
	LED2ThreadHandle = osThreadNew(LED2_Thread, NULL, &LED2_Thread_attributes);
	LED3ThreadHandle = osThreadNew(LED3_Thread, NULL, &LED3_Thread_attributes);
	LED1ERRORThreadHandle = osThreadNew(LED1_ERROR_Thread, NULL,
			&LED1_ERROR_Thread_attributes);
	TimerThreadHandle = osThreadNew(Timer_Thread, NULL,
			&Timer_Thread_attributes);

	UART_ThreadHandle = osThreadNew(UART_Thread, NULL, &UART_Thread_attributes);
	uartQueueHandle = osMessageQueueNew(1, sizeof(uint8_t),
			&uartQueue_attributes);
	pushButtonFlag = osEventFlagsNew(NULL);

	tim1_handle = osTimerNew(timerCallback, osTimerPeriodic, NULL,
			&tim1_attributes);

	if (pushButtonFlag == NULL) {
		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_SET); // DEBUG
		return (-1);
	}

	osKernelStart();

	while (1) {
		// We should never get here
	}
}

void HAL_TIM_PeriodElapsedCallback(TIM_HandleTypeDef *htim) {
	if (htim->Instance == TIM7) {
		HAL_IncTick();
	}
}

void USART1_IRQHandler(void) {
	HAL_UART_IRQHandler(&USB_UART);
}

void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart) {
	HAL_UART_Receive_IT(&USB_UART, &buffer, 1);
	osMessageQueuePut(uartQueueHandle, &buffer, 0U, 0U);
}

void GPIO_Init() {
	// Outputs LED1 and LED2 J13 and J5 respectively
	//GPIOJ->MODER
	GPIO_InitTypeDef GPIO_InitType = { .Mode = GPIO_MODE_OUTPUT_PP, .Pull =
	GPIO_PULLUP, .Speed = GPIO_SPEED_FREQ_MEDIUM };
	//PIN13 LED1
	GPIO_InitType.Pin = GPIO_PIN_13;
	HAL_GPIO_Init(GPIOJ, &GPIO_InitType);
	//PIN5 LED2
	GPIO_InitType.Pin = GPIO_PIN_5;
	HAL_GPIO_Init(GPIOJ, &GPIO_InitType);
	//PIN12 LED3
	GPIO_InitType.Pin = GPIO_PIN_12;
	HAL_GPIO_Init(GPIOA, &GPIO_InitType);
	//Turn on LED to ensure LED's states
	HAL_GPIO_WritePin(GPIOJ, GPIO_PIN_5, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOJ, GPIO_PIN_13, GPIO_PIN_RESET);
	HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_RESET);

	// PA0 button init
	GPIO_InitTypeDef GPIO_InitStruct = { .Pin = GPIO_PIN_0, .Mode =
			GPIO_MODE_IT_RISING_FALLING, .Pull = GPIO_NOPULL };
	HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

}

// This is the thread function
void LED1_Thread(void *argument) {
	while (1) {
		osMutexAcquire(LED1Mutex, osWaitForever);
		HAL_GPIO_TogglePin(GPIOJ, GPIO_PIN_13);
		osMutexRelease(LED1Mutex);
		osDelay(250);
	}
}

void LED2_Thread(void *argument) {
	while (1) {
		HAL_GPIO_TogglePin(GPIOJ, GPIO_PIN_5);
		osDelay(500);
	}
}

void LED3_Thread(void *argument) {
	//PA0 button interrupt
	HAL_NVIC_EnableIRQ(EXTI0_IRQn);
	HAL_NVIC_SetPriority(EXTI0_IRQn, 7, 1);
	while (1) {
		osThreadFlagsWait(0x00000001U, osFlagsWaitAny, osWaitForever); // Wait forever until thread flag 1 is set.
		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_SET);

		osThreadFlagsWait(0x00000011U, osFlagsWaitAny, osWaitForever); // Wait forever until thread flag 0 is set.
		HAL_GPIO_WritePin(GPIOA, GPIO_PIN_12, GPIO_PIN_RESET);
	}
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

void UART_Thread(void *argument) {
	uint8_t to_print;
	UART_init();
	HAL_UART_Receive_IT(&USB_UART, &buffer, 1);
	while (1) {
		if (osMessageQueueGet(uartQueueHandle, &to_print, NULL, osWaitForever)
				== osOK) {
			if (to_print == 'e') {
				status = osThreadFlagsSet(LED1ERRORThreadHandle, 0x00000001U);
			}
			if (to_print == 'n') {
				status = osThreadFlagsSet(LED1ERRORThreadHandle, 0x00000011U);
			}
			if (to_print == 'j'
					&& (osEventFlagsGet(pushButtonFlag) == 0x00000001U)) {
				status = osThreadFlagsSet(LED3ThreadHandle, 0x00000001U);
			} else {
				status = osThreadFlagsSet(LED3ThreadHandle, 0x00000010U);
				osEventFlagsClear(pushButtonFlag, 0x1);
			}
			printf("%c", to_print);
		}
	}
}

void Timer_Thread(void *argument) {
	osTimerStart(tim1_handle, 2000);
	while (1) {
		osThreadFlagsWait(0x00000010U, osFlagsWaitAny, osWaitForever);
		puts("+");
	}
}

void timerCallback() {
	status = osThreadFlagsSet(TimerThreadHandle, 0x00000010U);
}

void LED1_ERROR_Thread(void *argument) {
	while (1) {
		osThreadFlagsWait(0x00000001U, osFlagsWaitAny, osWaitForever);
		osThreadFlagsClear(0x00000001U);
		osMutexAcquire(LED1Mutex, osWaitForever); // try to acquire mutex
		while (1) {
			HAL_GPIO_TogglePin(GPIOJ, GPIO_PIN_13);
			osDelay(100);
			if (osThreadFlagsGet() & 0x00000010U) {
				break;
			}
		}
		osThreadFlagsClear(0x00000011U);
		osMutexRelease(LED1Mutex);
	}
}

void EXTI0_IRQHandler(void) {
	// When External interrupt 0 happened
	// Set flag here [EVENT]
	__HAL_GPIO_EXTI_CLEAR_IT(GPIO_PIN_0);  // Clear the interrupt flag
	osEventFlagsSet(pushButtonFlag, 0x00000001U);

}
