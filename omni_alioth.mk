#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/alioth

# Inherit some common pb stuff.
$(call inherit-product, vendor/pb/config/common.mk)

# Inherit from alioth device
$(call inherit-product, device/xiaomi/alioth/device.mk)

PRODUCT_DEVICE := alioth
PRODUCT_NAME := omni_alioth
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := M2012K11AC
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
