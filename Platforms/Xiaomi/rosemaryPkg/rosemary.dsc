## @file
#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018, Bingxing Wang. All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

################################################################################
#
# Defines Section - statements that will be processed to create a Makefile.
#
################################################################################
[Defines]
  PLATFORM_NAME                  = rosemary
  PLATFORM_GUID                  = 5e4b9710-f7e1-449e-a01b-56a01b10ca42
  PLATFORM_VERSION               = 0.1
  DSC_SPECIFICATION              = 0x00010005
  OUTPUT_DIRECTORY               = Build/rosemaryPkg-$(ARCH)
  SUPPORTED_ARCHITECTURES        = AARCH64
  BUILD_TARGETS                  = DEBUG|RELEASE
  SKUID_IDENTIFIER               = DEFAULT
  FLASH_DEFINITION               = rosemaryPkg/rosemary.fdf
  BROKEN_CNTFRQ_EL0              = 0
  DISPLAY_USES_RGBA              = 0
  HAS_SPECIAL_BUTTON             = 0

[BuildOptions.common]
  *_*_*_CC_FLAGS = -DDISPLAY_USES_RGBA=$(DISPLAY_USES_RGBA) -DHAS_SPECIAL_BUTTON=$(HAS_SPECIAL_BUTTON) -DBROKEN_CNTFRQ_EL0=$(BROKEN_CNTFRQ_EL0)

[LibraryClasses.common]
  PlatformMemoryMapLib|rosemaryPkg/Library/PlatformMemoryMapLib/PlatformMemoryMapLib.inf

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdSystemMemoryBase|0x80000000         # Starting address
!if $(RAM_SIZE) == 6
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x180000000        # 6GB Size
!elseif $(RAM_SIZE) == 8
  gArmTokenSpaceGuid.PcdSystemMemorySize|0x200000000        # 8GB Size
!else
!error "Invalid Mem Size! Use 6 or 8."
!endif

  gEfiMdeModulePkgTokenSpaceGuid.PcdFirmwareVendor|L"Daniel224455/6745"   # Device Maintainer

  gArmTokenSpaceGuid.PcdCpuVectorBaseAddress|0x40C40000

  gEmbeddedTokenSpaceGuid.PcdPrePiStackBase|0x40C00000
  gEmbeddedTokenSpaceGuid.PcdPrePiStackSize|0x00040000      # 256K stack

  # SmBios
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemVendor|"Xiaomi"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemModel|"Redmi Note 10S"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemRetailModel|"rosemary"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosSystemRetailSku|"RedmiNote10S_rosemary"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosBoardModel|"RedmiNote10S"

  # Simple FrameBuffer
  gMediatekPkgTokenSpaceGuid.PcdMipiFrameBufferWidth|1096
  gMediatekPkgTokenSpaceGuid.PcdMipiFrameBufferHeight|2400
  gMediatekPkgTokenSpaceGuid.PcdMipiFrameBufferPixelBpp|32

[PcdsDynamicDefault.common]
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdVideoVerticalResolution|2400
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoHorizontalResolution|1080
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupVideoVerticalResolution|2400
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutColumn|135
  gEfiMdeModulePkgTokenSpaceGuid.PcdSetupConOutRow|126
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutColumn|135
  gEfiMdeModulePkgTokenSpaceGuid.PcdConOutRow|126

!include MT6785Pkg/MT6785Pkg.dsc.inc
