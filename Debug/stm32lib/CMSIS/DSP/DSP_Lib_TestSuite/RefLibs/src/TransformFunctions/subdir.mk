################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/bitreversal.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/cfft.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/dct4.c \
C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/rfft.c 

OBJS += \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/bitreversal.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/cfft.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/dct4.o \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/rfft.o 

C_DEPS += \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/bitreversal.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/cfft.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/dct4.d \
./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/rfft.d 


# Each subdirectory must supply rules for building sources it contributes
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/bitreversal.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/bitreversal.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/cfft.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/cfft.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/dct4.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/dct4.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"
stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/rfft.o: C:/STM/workspace/stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/rfft.c stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m7 -std=gnu11 -g3 -DUSE_HAL_DRIVER -DUSE_STM32F769I_DISCO_REVB03 -DSTM32F769xx -DUSE_STM32F769I_DISCO -c -I"C:/STM/workspace/Final_Project_ver3/inc" -I"C:/STM/workspace/stm32lib/CMSIS/Include" -I"C:/STM/workspace/stm32lib/CMSIS/Device/ST/STM32F7xx/Include" -I"C:/STM/workspace/stm32lib/STM32F7xx_HAL_Driver/Inc" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/include" -I"C:/STM/workspace/Final_Project_ver3/Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP" -I"C:/STM/workspace/Final_Project_ver3/" -I"C:/STM/workspace/Final_Project_ver3/Final_Project_ver3/Libraries/BSP/STM32F769I-Discovery/" -I"C:/STM/workspace/Final_Project_ver3/src" -Og -ffunction-sections -Wall -Wdouble-promotion -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-stm32lib-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-TransformFunctions

clean-stm32lib-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-TransformFunctions:
	-$(RM) ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/bitreversal.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/bitreversal.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/bitreversal.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/bitreversal.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/cfft.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/cfft.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/cfft.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/cfft.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/dct4.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/dct4.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/dct4.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/dct4.su ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/rfft.cyclo ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/rfft.d ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/rfft.o ./stm32lib/CMSIS/DSP/DSP_Lib_TestSuite/RefLibs/src/TransformFunctions/rfft.su

.PHONY: clean-stm32lib-2f-CMSIS-2f-DSP-2f-DSP_Lib_TestSuite-2f-RefLibs-2f-src-2f-TransformFunctions

