################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.c 

OBJS += \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.o 

C_DEPS += \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.d 


# Each subdirectory must supply rules for building sources it contributes
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-stm32lib-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-JTest-2f-src

clean-stm32lib-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-JTest-2f-src:
	-$(RM) ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_cycle.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_dump_str_segments.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_fw.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/JTest/src/jtest_trigger_action.su

.PHONY: clean-stm32lib-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-JTest-2f-src

