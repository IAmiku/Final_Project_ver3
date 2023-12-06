################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/STM/workspace/stm32lib/CMSIS/DSP/Source/CommonTables/arm_common_tables.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/Source/CommonTables/arm_const_structs.c 

OBJS += \
./stm32lib/CMSIS/DSP/Source/CommonTables/arm_common_tables.o \
./stm32lib/CMSIS/DSP/Source/CommonTables/arm_const_structs.o 

C_DEPS += \
./stm32lib/CMSIS/DSP/Source/CommonTables/arm_common_tables.d \
./stm32lib/CMSIS/DSP/Source/CommonTables/arm_const_structs.d 


# Each subdirectory must supply rules for building sources it contributes
stm32lib/CMSIS/DSP/Source/CommonTables/arm_common_tables.o: C:/STM/workspace/stm32lib/CMSIS/DSP/Source/CommonTables/arm_common_tables.c stm32lib/CMSIS/DSP/Source/CommonTables/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/Source/CommonTables/arm_const_structs.o: C:/STM/workspace/stm32lib/CMSIS/DSP/Source/CommonTables/arm_const_structs.c stm32lib/CMSIS/DSP/Source/CommonTables/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-stm32lib-2f-CMSIS-2f-DSP-2f-Source-2f-CommonTables

clean-stm32lib-2f-CMSIS-2f-DSP-2f-Source-2f-CommonTables:
	-$(RM) ./stm32lib/CMSIS/DSP/Source/CommonTables/arm_common_tables.cyclo ./stm32lib/CMSIS/DSP/Source/CommonTables/arm_common_tables.d ./stm32lib/CMSIS/DSP/Source/CommonTables/arm_common_tables.o ./stm32lib/CMSIS/DSP/Source/CommonTables/arm_common_tables.su ./stm32lib/CMSIS/DSP/Source/CommonTables/arm_const_structs.cyclo ./stm32lib/CMSIS/DSP/Source/CommonTables/arm_const_structs.d ./stm32lib/CMSIS/DSP/Source/CommonTables/arm_const_structs.o ./stm32lib/CMSIS/DSP/Source/CommonTables/arm_const_structs.su

.PHONY: clean-stm32lib-2f-CMSIS-2f-DSP-2f-Source-2f-CommonTables

