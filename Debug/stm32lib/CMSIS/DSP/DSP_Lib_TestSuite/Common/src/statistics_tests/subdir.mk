################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.c 

OBJS += \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.o 

C_DEPS += \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.d 


# Each subdirectory must supply rules for building sources it contributes
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-stm32lib-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-src-2f-statistics_tests

clean-stm32lib-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-src-2f-statistics_tests:
	-$(RM) ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/max_tests.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/mean_tests.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/min_tests.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/power_tests.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/rms_tests.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_common_data.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/statistics_test_group.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/std_tests.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/Common/src/statistics_tests/var_tests.su

.PHONY: clean-stm32lib-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-Common-2f-src-2f-statistics_tests

