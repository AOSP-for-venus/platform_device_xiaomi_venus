#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Inherit from miuicamera-venus
$(call inherit-product-if-exists, device/xiaomi/miuicamera-venus/device.mk)

# Display Device Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_4630946736638489730.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_id_4630946736638489730.xml

# Fingerprint
PRODUCT_PACKAGES += \
    libudfpshandler

# Init scripts
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.venus.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.venus.rc

# Kernel
TARGET_KERNEL_DIR ?= device/xiaomi/venus-kernel
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image

PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

# Kernel Headers
PRODUCT_VENDOR_KERNEL_HEADERS += device/xiaomi/venus-kernel/kernel-headers

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-statix

PRODUCT_PACKAGES += \
    ApertureResVenus \
    FrameworksResVenus \
    NfcResVenus \
    SettingsOverlayM2011K2C \
    SettingsOverlayM2011K2G \
    SettingsProviderOverlayVenus \
    SettingsResVenus \
    SystemUIResVenus \
    WifiResVenus

# Powershare
$(call inherit-product, vendor/hardware/xiaomi/aidl/powershare/product.mk)

# Sensors
PRODUCT_PACKAGES += \
    sensors.xiaomi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.xiaomi_sm8350

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/venus/venus-vendor.mk)
