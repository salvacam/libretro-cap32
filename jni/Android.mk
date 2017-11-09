LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := retro

ifeq ($(TARGET_ARCH),arm)
LOCAL_CFLAGS += -DANDROID_ARM
LOCAL_ARM_MODE := arm
endif

ifeq ($(TARGET_ARCH),x86)
LOCAL_CFLAGS +=  -DANDROID_X86
endif

ifeq ($(TARGET_ARCH),mips)
LOCAL_CFLAGS += -DANDROID_MIPS -D__mips__ -D__MIPSEL__
endif

CORE_DIR	= ..

include $(CORE_DIR)/Makefile.common

LOCAL_SRC_FILES    += $(SOURCES_C)
LOCAL_CFLAGS += -O2 -D__LIBRETRO__ -DFRONTEND_SUPPORTS_RGB565 -DNDEBUG=1 -DINLINE="inline" $(INCFLAGS)

LOCAL_LDLIBS += -lz -llog

include $(BUILD_SHARED_LIBRARY)
