################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/init.c \
../src/stm32f7xx_hal_timebase_tim.c \
../src/task5.c \
../src/uart.c 

OBJS += \
./src/init.o \
./src/stm32f7xx_hal_timebase_tim.o \
./src/task5.o \
./src/uart.o 

C_DEPS += \
./src/init.d \
./src/stm32f7xx_hal_timebase_tim.d \
./src/task5.d \
./src/uart.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o src/%.su src/%.cyclo: ../src/%.c src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-src

clean-src:
	-$(RM) ./src/init.cyclo ./src/init.d ./src/init.o ./src/init.su ./src/stm32f7xx_hal_timebase_tim.cyclo ./src/stm32f7xx_hal_timebase_tim.d ./src/stm32f7xx_hal_timebase_tim.o ./src/stm32f7xx_hal_timebase_tim.su ./src/task5.cyclo ./src/task5.d ./src/task5.o ./src/task5.su ./src/uart.cyclo ./src/uart.d ./src/uart.o ./src/uart.su

.PHONY: clean-src

