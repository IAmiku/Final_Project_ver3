################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include stm32lib/STM32F7xx_HAL_Driver/Src/Legacy/subdir.mk
-include stm32lib/STM32F7xx_HAL_Driver/Src/subdir.mk
-include stm32lib/CMSIS/Device/ST/STM32F7xx/Source/Templates/subdir.mk
-include startup/subdir.mk
-include src/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/MemMang/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/portable/GCC/ARM_CM7/r0p1/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/CMSIS_RTOS_V2/subdir.mk
-include Middlewares/Third_Party/FreeRTOS/Source/subdir.mk
-include Libraries/Utilities/Fonts/subdir.mk
-include Libraries/BSP/STM32F769I-Discovery/subdir.mk
-include Libraries/BSP/Components/wm8994/subdir.mk
-include Libraries/BSP/Components/ts3510/subdir.mk
-include Libraries/BSP/Components/stmpe811/subdir.mk
-include Libraries/BSP/Components/st7789h2/subdir.mk
-include Libraries/BSP/Components/st7735/subdir.mk
-include Libraries/BSP/Components/s5k5cag/subdir.mk
-include Libraries/BSP/Components/ov9655/subdir.mk
-include Libraries/BSP/Components/otm8009a/subdir.mk
-include Libraries/BSP/Components/nt35510/subdir.mk
-include Libraries/BSP/Components/mfxstm32l152/subdir.mk
-include Libraries/BSP/Components/ft6x06/subdir.mk
-include Libraries/BSP/Components/ft5336/subdir.mk
-include Libraries/BSP/Components/exc7200/subdir.mk
-include Libraries/BSP/Components/adv7533/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := Final_Project_ver3
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
Final_Project_ver3.elf \

MAP_FILES += \
Final_Project_ver3.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
Final_Project_ver3.list \

OBJCOPY_BIN += \
Final_Project_ver3.bin \


# All Target
all: main-build

# Main-build Target
main-build: Final_Project_ver3.elf secondary-outputs

# Tool invocations
Final_Project_ver3.elf Final_Project_ver3.map: $(OBJS) $(USER_OBJS) C:\STM\workspace\Final_Project_ver3\LinkerScript.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "Final_Project_ver3.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m7 -T"C:\STM\workspace\Final_Project_ver3\LinkerScript.ld" --specs=nosys.specs -Wl,-Map="Final_Project_ver3.map" -Wl,--gc-sections -static --specs=nano.specs -mfpu=fpv5-d16 -mfloat-abi=hard -mthumb -u _printf_float -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

Final_Project_ver3.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "Final_Project_ver3.list"
	@echo 'Finished building: $@'
	@echo ' '

Final_Project_ver3.bin: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objcopy  -O binary $(EXECUTABLES) "Final_Project_ver3.bin"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) Final_Project_ver3.bin Final_Project_ver3.elf Final_Project_ver3.list Final_Project_ver3.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST) $(OBJCOPY_BIN)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
