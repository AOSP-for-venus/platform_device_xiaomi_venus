#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/venus

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Board
TARGET_BOOTLOADER_BOARD_NAME := venus

# Display
TARGET_SCREEN_DENSITY := 560

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/hidl/manifest.xml

# Kernel modules
BOOT_KERNEL_MODULES := \
    fts_touch_spi.ko \
    hwid.ko \
    msm_drm.ko \
    xiaomi_touch.ko

KERNEL_MODULES_INSTALL := vendor_dlkm
KERNEL_MODULES_OUT := $(OUT_DIR)/target/product/$(PRODUCT_DEVICE)/$(KERNEL_MODULES_INSTALL)/lib/modules
KERNEL_MODULES := $(wildcard $(KERNEL_MODULE_OUT)/*.ko)
BOARD_VENDOR_KERNEL_MODULES := $(KERNEL_MODULES)
BOARD_VENDOR_KERNEL_MODULES_LOAD := $(strip $(shell cat $(DEVICE_PATH)/modules.load))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES := $(addprefix $(KERNEL_MODULE_OUT)/, $(notdir $(BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD)))
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD := $(BOOT_KERNEL_MODULES)
BOARD_BUILD_VENDOR_RAMDISK_IMAGE := true

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 113254576128

# Recovery
TARGET_RECOVERY_UI_MARGIN_HEIGHT := 165

# Include proprietary files
include vendor/xiaomi/venus/BoardConfigVendor.mk
include vendor/xiaomi/venus-firmware/BoardConfigVendor.mk
