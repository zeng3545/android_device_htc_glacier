#
# Copyright (C) 2011 The CyanogenMod Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/glacier/ramdisk/init.glacier.rc:root/init.glacier.rc \
    device/htc/glacier/ramdisk/ueventd.glacier.rc:root/ueventd.glacier.rc \
    device/htc/glacier/ramdisk/fstab.glacier:root/fstab.glacier \
    device/htc/glacier/ramdisk/zram.sh:root/sbin/zram.sh

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/glacier/device-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=4.0_r1 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

DEVICE_PACKAGE_OVERLAYS += device/htc/glacier/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/voicemail-conf.xml:system/etc/voicemail-conf.xml

PRODUCT_PACKAGES += \
    lights.glacier \
    sensors.glacier \
    gps.glacier

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/glacier/prebuilt/keylayout/glacier-keypad.kl:system/usr/keylayout/glacier-keypad.kl

# IDC Files
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/glacier/prebuilt/idc/glacier-keypad.idc:system/usr/idc/glacier-keypad.idc \
    device/htc/glacier/prebuilt/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc \

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/keychars/glacier-keypad.kcm.bin:system/usr/keychars/glacier-keypad.kcm.bin

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/glacier/prebuilt/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/glacier/prebuilt/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/glacier/prebuilt/firmware/default_org_WA.acdb:system/etc/firmware/default_org_WA.acdb

# Vold
PRODUCT_COPY_FILES += \
    device/htc/glacier/prebuilt/vold.fstab:system/etc/vold.fstab

# High-density art, but English locale
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

# common msm7x30 configs
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/glacier/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/glacier/media_htcaudio.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
