#
# Copyright (C) 2021-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from aston device
$(call inherit-product, device/oneplus/aston/device.mk)

# Inherit some common ASCP stuff.
$(call inherit-product, vendor/custom/config/common_full_phone.mk)

PRODUCT_NAME := aston
PRODUCT_DEVICE := aston
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := CPH2609

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="aston-user 15 AQ3A.241006.001 release-keys" \
    BuildFingerprint=OnePlus/CPH2609/aston:15/AQ3A.241006.001:user/release-keys \
    DeviceProduct=aston \
    SystemName=aston

# Prebuilt DTB
TARGET_USES_PREBUILT_DTB := false

# Device config
TARGET_HAS_UDFPS := true
TARGET_ENABLE_BLUR := true
TARGET_EXCLUDES_AUDIOFX := false
TARGET_FACE_UNLOCK_SUPPORTED := true

# ASCP
ASCP_BUILD_TYPE := OFFICIAL
ASCP_TYPE_CODE := OF
WITH_REVANCED := true
ASCP_MAINTAINER := Gaurav
PERF_ANIM_OVERRIDE := true
