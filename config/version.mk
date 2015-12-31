PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# SSHD Versioning System
PRODUCT_VERSION_MAJOR = MM-6.0.1-$(BUILD_ID)
PRODUCT_VERSION_MINOR = Alpha
PRODUCT_VERSION_MAINTENANCE =1
ifdef SSHD_BUILD_EXTRA
    SSHD_POSTFIX := -$(SSHD_BUILD_EXTRA)
endif
ifndef SSHD_BUILD_TYPE
    SSHD_BUILD_TYPE :=UNOFFICIAL
    PLATFORM_VERSION_CODENAME :=UNOFFICIAL
    SSHD_POSTFIX := -$(shell date +"%Y%m%d")
endif


# Set all versions
SSHD_VERSION := SSHD-$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(SSHD_BUILD_TYPE)$(SSHD_POSTFIX)
SSHD_MOD_VERSION := SSHD-$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(SSHD_BUILD_TYPE)$(SSHD_POSTFIX)-$(SSHD_BUILD)

# Apply it to build.prop
PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    sshd.ota.version=$(PRODUCT_VERSION_MAJOR)-$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE) \
    ro.sshd.version=$(SSHD_VERSION) \
    ro.modversion=$(SSHD_MOD_VERSION) \
    ro.sshd.releasetype=$(SSHD_BUILD_TYPE)