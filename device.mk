#
# Copyright (C) 2022 Team Win Recovery Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Crypto
MITHORIUM_INCLUDE_CRYPTO_FBE := true

# Disable crypto temporarily
MITHORIUM_INCLUDE_CRYPTO_FBE := false
MITHORIUM_INCLUDE_CRYPTO_FDE := false
MITHORIUM_INCLUDE_CRYPTO := false

# Fstab
MITHORIUM_USES_DEVICE_SPECIFIC_FSTAB := true

# Inherit from mithorium-common
$(call inherit-product, device/xiaomi/mithorium-common/mithorium.mk)

# Dynamic Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
