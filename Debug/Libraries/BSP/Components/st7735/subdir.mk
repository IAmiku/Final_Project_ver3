################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libraries/BSP/Components/st7735/st7735.c 

OBJS += \
./Libraries/BSP/Components/st7735/st7735.o 

C_DEPS += \
./Libraries/BSP/Components/st7735/st7735.d 


# Each subdirectory must supply rules for building sources it contributes
Libraries/BSP/Components/st7735/%.o Libraries/BSP/Components/st7735/%.su Libraries/BSP/Components/st7735/%.cyclo: ../Libraries/BSP/Components/st7735/%.c Libraries/BSP/Components/st7735/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libraries-2f-BSP-2f-Components-2f-st7735

clean-Libraries-2f-BSP-2f-Components-2f-st7735:
	-$(RM) ./Libraries/BSP/Components/st7735/st7735.cyclo ./Libraries/BSP/Components/st7735/st7735.d ./Libraries/BSP/Components/st7735/st7735.o ./Libraries/BSP/Components/st7735/st7735.su

.PHONY: clean-Libraries-2f-BSP-2f-Components-2f-st7735

