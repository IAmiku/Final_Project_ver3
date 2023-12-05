################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Libraries/Utilities/Fonts/font12.c \
../Libraries/Utilities/Fonts/font16.c \
../Libraries/Utilities/Fonts/font20.c \
../Libraries/Utilities/Fonts/font24.c \
../Libraries/Utilities/Fonts/font8.c 

OBJS += \
./Libraries/Utilities/Fonts/font12.o \
./Libraries/Utilities/Fonts/font16.o \
./Libraries/Utilities/Fonts/font20.o \
./Libraries/Utilities/Fonts/font24.o \
./Libraries/Utilities/Fonts/font8.o 

C_DEPS += \
./Libraries/Utilities/Fonts/font12.d \
./Libraries/Utilities/Fonts/font16.d \
./Libraries/Utilities/Fonts/font20.d \
./Libraries/Utilities/Fonts/font24.d \
./Libraries/Utilities/Fonts/font8.d 


# Each subdirectory must supply rules for building sources it contributes
Libraries/Utilities/Fonts/%.o Libraries/Utilities/Fonts/%.su Libraries/Utilities/Fonts/%.cyclo: ../Libraries/Utilities/Fonts/%.c Libraries/Utilities/Fonts/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"/Users/diher/Documents/GitHub/Final_Project_ver3/inc" -I"/Users/diher/STM/stm32lib/CMSIS/Include" -I"/Users/diher/STM/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"/Users/diher/STM/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/" -I"/Users/diher/Documents/GitHub/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Libraries-2f-Utilities-2f-Fonts

clean-Libraries-2f-Utilities-2f-Fonts:
	-$(RM) ./Libraries/Utilities/Fonts/font12.cyclo ./Libraries/Utilities/Fonts/font12.d ./Libraries/Utilities/Fonts/font12.o ./Libraries/Utilities/Fonts/font12.su ./Libraries/Utilities/Fonts/font16.cyclo ./Libraries/Utilities/Fonts/font16.d ./Libraries/Utilities/Fonts/font16.o ./Libraries/Utilities/Fonts/font16.su ./Libraries/Utilities/Fonts/font20.cyclo ./Libraries/Utilities/Fonts/font20.d ./Libraries/Utilities/Fonts/font20.o ./Libraries/Utilities/Fonts/font20.su ./Libraries/Utilities/Fonts/font24.cyclo ./Libraries/Utilities/Fonts/font24.d ./Libraries/Utilities/Fonts/font24.o ./Libraries/Utilities/Fonts/font24.su ./Libraries/Utilities/Fonts/font8.cyclo ./Libraries/Utilities/Fonts/font8.d ./Libraries/Utilities/Fonts/font8.o ./Libraries/Utilities/Fonts/font8.su

.PHONY: clean-Libraries-2f-Utilities-2f-Fonts

