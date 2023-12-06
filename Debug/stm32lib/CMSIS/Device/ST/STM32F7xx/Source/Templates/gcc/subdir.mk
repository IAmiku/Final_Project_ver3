################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f722xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f723xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f730xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f732xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f733xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f745xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f746xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f750xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f756xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f765xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f767xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f769xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f777xx.s \
C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f779xx.s 

OBJS += \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f722xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f723xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f730xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f732xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f733xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f745xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f746xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f750xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f756xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f765xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f767xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f769xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f777xx.o \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f779xx.o 

S_DEPS += \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f722xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f723xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f730xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f732xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f733xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f745xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f746xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f750xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f756xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f765xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f767xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f769xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f777xx.d \
./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f779xx.d 


# Each subdirectory must supply rules for building sources it contributes
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f722xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f722xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f723xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f723xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f730xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f730xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f732xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f732xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f733xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f733xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f745xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f745xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f746xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f746xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f750xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f750xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f756xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f756xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f765xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f765xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f767xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f767xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f769xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f769xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f777xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f777xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"
stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f779xx.o: C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f779xx.s stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m7 -g3 -c -I"C:/STM/workspace/Final_Project_ver3/inc" -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@" "$<"

clean: clean-stm32lib-2f-CMSIS-2f-Device-2f-ST-2f-STM32F7xx-2f-Source-2f-Templates-2f-gcc

clean-stm32lib-2f-CMSIS-2f-Device-2f-ST-2f-STM32F7xx-2f-Source-2f-Templates-2f-gcc:
	-$(RM) ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f722xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f722xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f723xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f723xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f730xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f730xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f732xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f732xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f733xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f733xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f745xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f745xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f746xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f746xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f750xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f750xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f756xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f756xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f765xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f765xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f767xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f767xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f769xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f769xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f777xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f777xx.o ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f779xx.d ./stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/gcc/startup_stm32f779xx.o

.PHONY: clean-stm32lib-2f-CMSIS-2f-Device-2f-ST-2f-STM32F7xx-2f-Source-2f-Templates-2f-gcc

