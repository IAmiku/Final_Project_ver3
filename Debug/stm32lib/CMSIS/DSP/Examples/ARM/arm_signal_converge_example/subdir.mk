################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/STM/workspace/stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_data.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_example_f32.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/math_helper.c 

OBJS += \
./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_data.o \
./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_example_f32.o \
./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/math_helper.o 

C_DEPS += \
./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_data.d \
./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_example_f32.d \
./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/math_helper.d 


# Each subdirectory must supply rules for building sources it contributes
stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_data.o: C:/STM/workspace/stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_data.c stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_example_f32.o: C:/STM/workspace/stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_example_f32.c stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/math_helper.o: C:/STM/workspace/stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/math_helper.c stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-stm32lib-2f-CMSIS-2f-DSP-2f-Examples-2f-ARM-2f-arm_signal_converge_example

clean-stm32lib-2f-CMSIS-2f-DSP-2f-Examples-2f-ARM-2f-arm_signal_converge_example:
	-$(RM) ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_data.cyclo ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_data.d ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_data.o ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_data.su ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_example_f32.cyclo ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_example_f32.d ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_example_f32.o ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/arm_signal_converge_example_f32.su ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/math_helper.cyclo ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/math_helper.d ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/math_helper.o ./stm32lib/CMSIS/DSP/Examples/ARM/arm_signal_converge_example/math_helper.su

.PHONY: clean-stm32lib-2f-CMSIS-2f-DSP-2f-Examples-2f-ARM-2f-arm_signal_converge_example

