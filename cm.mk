## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := MT4G

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/glacier/full_glacier.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_glacier
PRODUCT_DEVICE := glacier
PRODUCT_BRAND := tmobile
PRODUCT_MODEL := HTC Glacier
PRODUCT_MANUFACTURER := HTC

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_glacier BUILD_FINGERPRINT="google/yakju/maguro:4.0.2/ICL53F/235179:user/release-keys" PRIVATE_BUILD_DESC="2.19.531.1 CL95282 release-keys"
