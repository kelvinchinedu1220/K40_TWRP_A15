#
# SPDX-License-Identifier: Apache-2.0
#
# Copyright (C) 2021-2024 The pbrp Recovery Project
# SPDX-License-Identifier: GPL-3.0-or-later
#

DEVICE_PATH := device/xiaomi/alioth

# Release name
PRODUCT_RELEASE_NAME := alioth

# Inherit from alioth device
(call inherit-product, device/xiaomi/alioth/device.mk)

# Inherit some common pbrp stuff
$(call inherit-product, vendor/pb/config/common.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := omni_alioth
PRODUCT_DEVICE := alioth
PRODUCT_BRAND := POCO
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := POCO F3

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
#
