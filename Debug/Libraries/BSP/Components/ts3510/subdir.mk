################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libraries/BSP/Components/ts3510/ts3510.c 

OBJS += \
./Libraries/BSP/Components/ts3510/ts3510.o 

C_DEPS += \
./Libraries/BSP/Components/ts3510/ts3510.d 


# Each subdirectory must supply rules for building sources it contributes
Libraries/BSP/Components/ts3510/%.o Libraries/BSP/Components/ts3510/%.su Libraries/BSP/Components/ts3510/%.cyclo: ../Libraries/BSP/Components/ts3510/%.c Libraries/BSP/Components/ts3510/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"/Users/diher/Documents/GitHub/Final_Project_ver3/inc" -I"/Users/diher/STM/stm32lib/CMSIS/Include" -I"/Users/diher/STM/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"/Users/diher/STM/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libraries-2f-BSP-2f-Components-2f-ts3510

clean-Libraries-2f-BSP-2f-Components-2f-ts3510:
	-$(RM) ./Libraries/BSP/Components/ts3510/ts3510.cyclo ./Libraries/BSP/Components/ts3510/ts3510.d ./Libraries/BSP/Components/ts3510/ts3510.o ./Libraries/BSP/Components/ts3510/ts3510.su

.PHONY: clean-Libraries-2f-BSP-2f-Components-2f-ts3510

