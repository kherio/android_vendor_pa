# Copyright (C) 2016-2017 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ifeq (pa_h930,$(TARGET_PRODUCT))

# We have our own sepolicy
TARGET_EXCLUDE_QCOM_SEPOLICY := true

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)
$(call inherit-product, device/lge/h930/full_h930.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/lge/h930/h930.mk)

# Include ParanoidAndroid BootAnimation
TARGET_BOOT_ANIMATION_RES := 1080

# Generic CAF packages
include device/qcom/common/common.mk

# Overlays (inherit after vendor/cm to ensure we override it)
DEVICE_PACKAGE_OVERLAYS += devide/lge/h930/overlay

# Override AOSP build properties
PRODUCT_NAME := pa_h930
PRODUCT_DEVICE := joan
PRODUCT_BRAND := LG
PRODUCT_MODEL := V30
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=pa_h930 \
    BUILD_FINGERPRINT=lge/joan_global_com/joan:8.0.0/OPR1.170623.026/181381736b4e9:user/release-keys \
    PRIVATE_BUILD_DESC="joan_global_com-user 8.0.0 OPR1.170623.026 181381736b4e9 release-keys"

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += ro.product.model ro.vendor.product.model

# Paranoid Android platform
include vendor/pa/main.mk

endif
