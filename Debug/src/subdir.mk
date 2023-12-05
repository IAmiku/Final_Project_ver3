################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/final_project.c \
../src/init.c \
../src/mpu6050.c \
../src/stm32f7xx_hal_timebase_tim.c \
../src/uart.c 

OBJS += \
./src/final_project.o \
./src/init.o \
./src/mpu6050.o \
./src/stm32f7xx_hal_timebase_tim.o \
./src/uart.o 

C_DEPS += \
./src/final_project.d \
./src/init.d \
./src/mpu6050.d \
./src/stm32f7xx_hal_timebase_tim.d \
./src/uart.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o src/%.su src/%.cyclo: ../src/%.c src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"/Users/diher/Documents/GitHub/Final_Project_ver3/inc" -I"/Users/diher/STM/stm32lib/CMSIS/Include" -I"/Users/diher/STM/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"/Users/diher/STM/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-src

clean-src:
	-$(RM) ./src/final_project.cyclo ./src/final_project.d ./src/final_project.o ./src/final_project.su ./src/init.cyclo ./src/init.d ./src/init.o ./src/init.su ./src/mpu6050.cyclo ./src/mpu6050.d ./src/mpu6050.o ./src/mpu6050.su ./src/stm32f7xx_hal_timebase_tim.cyclo ./src/stm32f7xx_hal_timebase_tim.d ./src/stm32f7xx_hal_timebase_tim.o ./src/stm32f7xx_hal_timebase_tim.su ./src/uart.cyclo ./src/uart.d ./src/uart.o ./src/uart.su

.PHONY: clean-src

