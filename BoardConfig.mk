#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from common mithorium-common
include device/xiaomi/mithorium-common/BoardConfigCommon.mk

DEVICE_PATH := device/motorola/moto8937
USES_DEVICE_MOTOROLA_MOTO8937 := true

# Kernel
ifneq ($(wildcard device/motorola/kernel-motothorium/$(PRODUCT_RELEASE_NAME)/Image.gz-dtb),)
TARGET_PREBUILT_KERNEL := device/motorola/kernel-motothorium/$(PRODUCT_RELEASE_NAME)/Image.gz-dtb
else
BOARD_MKBOOTIMG_ARGS += --dt device/motorola/kernel-motothorium/$(PRODUCT_RELEASE_NAME)/dt.img
TARGET_PREBUILT_KERNEL := device/motorola/kernel-motothorium/$(PRODUCT_RELEASE_NAME)/Image.gz
endif

# Partitions
BOARD_USES_METADATA_PARTITION := true

# Partitions - dynamic (Not accurate for all devices)
BOARD_SUPER_PARTITION_BLOCK_DEVICES := oem system vendor
BOARD_SUPER_PARTITION_METADATA_DEVICE := system
BOARD_SUPER_PARTITION_OEM_DEVICE_SIZE := 1711276032
BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE := 3221225472
BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE := 536870912
BOARD_SUPER_PARTITION_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_OEM_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_SYSTEM_DEVICE_SIZE) + $(BOARD_SUPER_PARTITION_VENDOR_DEVICE_SIZE) )

BOARD_SUPER_PARTITION_GROUPS := moto8937_dynpart_v1
BOARD_MOTO8937_DYNPART_V1_SIZE := $(shell expr $(BOARD_SUPER_PARTITION_SIZE) - 4194304 )
BOARD_MOTO8937_DYNPART_V1_PARTITION_LIST := system system_ext product vendor odm

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += $(DEVICE_PATH)

# TWRP - Crypto - FBE
ifeq ($(TARGET_KERNEL_VERSION),4.19)
TW_USE_FSCRYPT_POLICY := 2
endif
