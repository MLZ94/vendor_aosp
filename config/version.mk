# Version
CUSTOM_AOSP_VERSION := hornbillOS
CUSTOM_ANDROID_NAME := eleven
CUSTOM_ANDROID_VERSION := v2.0.3
CUSTOM_BUILD_DATE=$(shell date +"%Y%m%d-%H%M")
CUSTOM_DEVICE := $(LINEAGE_BUILD)

ifndef CUSTOM_BUILD_TYPE
    CUSTOM_BUILD_TYPE := UNOFFICIAL
endif
ifeq ($(CUSTOM_BUILD_TYPE), BETA OFFICIAL)
    CUSTOM_VERSION := $(CUSTOM_AOSP_VERSION)-$(CUSTOM_ANDROID_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_DEVICE)
#    PRODUCT_PACKAGES += \
#        Updater
else
    CUSTOM_VERSION := $(CUSTOM_AOSP_VERSION)-$(CUSTOM_ANDROID_VERSION)-$(CUSTOM_BUILD_DATE)-$(CUSTOM_DEVICE)-$(CUSTOM_BUILD_TYPE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.custom.version=$(CUSTOM_VERSION) \
    ro.custom.buildtype=$(CUSTOM_BUILD_TYPE) \
    ro.custom.build.date=$(CUSTOM_BUILD_DATE) \
    ro.custom.device=$(CUSTOM_DEVICE) \
    ro.custom.android.name=$(CUSTOM_ANDROID_NAME) \
    ro.custom.android.version=$(CUSTOM_ANDROID_VERSION)
