$(call inherit-product, device/htc/glacier/full_glacier.mk)

PRODUCT_RELEASE_NAME := MT4G

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

#PRODUCT_BUILD_PROP_OVERRIDES += 

PRODUCT_NAME := cm_glacier
PRODUCT_DEVICE := glacier
