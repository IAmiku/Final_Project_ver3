################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/iar/startup_stm32f769xx.s 

OBJS += \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/iar/startup_stm32f769xx.o 

S_DEPS += \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/iar/startup_stm32f769xx.d 


# Each subdirectory must supply rules for building sources it contributes
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/iar/startup_stm32f769xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/iar/startup_stm32f769xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/iar/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-stm32lib-2f-CMSIS-2f-Device-2f-ST-2f-STM32F7xx-2f-Source-2f-Templates-2f-iar

clean-stm32lib-2f-CMSIS-2f-Device-2f-ST-2f-STM32F7xx-2f-Source-2f-Templates-2f-iar:
	-$(RM) ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/iar/startup_stm32f769xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/iar/startup_stm32f769xx.o

.PHONY: clean-stm32lib-2f-CMSIS-2f-Device-2f-ST-2f-STM32F7xx-2f-Source-2f-Templates-2f-iar

