#
# Copyright (C) 2020 The Android Open Source Project
# 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/xiaomi/alioth

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := kona
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true

# 12.1 manifest requirements
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_MISSING_REQUIRED_MODULES := true # may not really be needed

# Assert
TARGET_OTA_ASSERT_DEVICE := alioth, aliothin

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 \
        androidboot.hardware=qcom \
        androidboot.console=ttyMSM0 \
        androidboot.memcg=1 \
        lpm_levels.sleep_disabled=1 \
        video=vfb:640x400,bpp=32,memsize=3072000 \
        msm_rtb.filter=0x237 \
        service_locator.enable=1 \
        androidboot.usbcontroller=a600000.dwc3 \
        swiotlb=2048 \
        loop.max_part=7 \
        cgroup.memory=nokmem,nosocket \
        reboot=panic_warm \
        androidboot.selinux=permissive

BOARD_BOOT_HEADER_VERSION := 3
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_PAGESIZE := 4096
BOARD_VENDOR_BASE    := 0x00000000
BOARD_KERNEL_OFFSET  := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_TAGS_OFFSET    := 0x00000100

TARGET_KERNEL_ARCH := arm64
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilts/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilts/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilts/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

BOARD_MKBOOTIMG_ARGS := \
            --pagesize $(BOARD_KERNEL_PAGESIZE)
            --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
            --kernel_offset $(BOARD_KERNEL_OFFSET)
            --header_version $(BOARD_BOOT_HEADER_VERSION)

# Avb
BOARD_AVB_ENABLE := true
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

# Platform
TARGET_BOARD_PLATFORM := sm8250
TARGET_BOARD_PLATFORM_GPU := qcom-adreno650
TARGET_USES_HARDWARE_QCOM_BOOTCTRL := true
QCOM_BOARD_PLATFORMS += $(TARGET_BOARD_PLATFORM)

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE:= 100663296
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 114898743296
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
BOARD_ROOT_EXTRA_FOLDERS := bluetooth dsp firmware persist

# Metadata
BOARD_USES_METADATA_PARTITION := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# File systems
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4

#A/B
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false

AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    odm \
    product \
    system \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_USES_MKE2FS := true

# System prop
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# recovery fstab
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab

# Super
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := $(BOARD_SUPER_PARTITION_SIZE)
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := product vendor system system_ext odm

# exFAT FS Support
TW_INCLUDE_FUSE_EXFAT := true

# NTFS Support
TW_INCLUDE_NTFS_3G := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true
