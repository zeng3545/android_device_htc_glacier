$(call inherit-product, device/htc/glacier/full_glacier.mk)

PRODUCT_RELEASE_NAME := MT4G

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_glacier BUILD_FINGERPRINT=htc_europe/htc_primou/primou:4.0.3/IML74K/39988.1:user/release-keys PRIVATE_BUILD_DESC="2.19.531.1 CL95282 release-keys"

PRODUCT_NAME := cm_glacier
PRODUCT_DEVICE := glacier
