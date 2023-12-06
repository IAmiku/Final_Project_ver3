################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery.c \
../Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_lcd.c \
../Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_sdram.c 

OBJS += \
./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery.o \
./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_lcd.o \
./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_sdram.o 

C_DEPS += \
./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery.d \
./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_lcd.d \
./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_sdram.d 


# Each subdirectory must supply rules for building sources it contributes
Libraries/BSP/STM32F769I-Discovery/%.o Libraries/BSP/STM32F769I-Discovery/%.su Libraries/BSP/STM32F769I-Discovery/%.cyclo: ../Libraries/BSP/STM32F769I-Discovery/%.c Libraries/BSP/STM32F769I-Discovery/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libraries-2f-BSP-2f-STM32F769I-2d-Discovery

clean-Libraries-2f-BSP-2f-STM32F769I-2d-Discovery:
	-$(RM) ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery.cyclo ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery.d ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery.o ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery.su ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_lcd.cyclo ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_lcd.d ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_lcd.o ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_lcd.su ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_sdram.cyclo ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_sdram.d ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_sdram.o ./Libraries/BSP/STM32F769I-Discovery/stm32f769i_discovery_sdram.su

.PHONY: clean-Libraries-2f-BSP-2f-STM32F769I-2d-Discovery

