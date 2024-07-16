## @file
#
#  Copyright (c) 2011-2015, ARM Limited. All rights reserved.
#  Copyright (c) 2014, Linaro Limited. All rights reserved.
#  Copyright (c) 2015 - 2016, Intel Corporation. All rights reserved.
#  Copyright (c) 2018 - 2019, Bingxing Wang. All rights reserved.
#
#  SPDX-License-Identifier: BSD-2-Clause-Patent
#
##

# SoC Defines
[Defines]
  USE_PHYSICAL_TIMER          = 1
  PRECOMPILED_CRYPTO_BINARIES = 0

[BuildOptions.common]
  *_*_AARCH64_CC_FLAGS = -march=armv8.2-a+crypto+rcpc

[PcdsFixedAtBuild.common]
  gArmTokenSpaceGuid.PcdArmArchTimerFreqInHz|13000000
  gArmTokenSpaceGuid.PcdArmArchTimerSecIntrNum|13
  gArmTokenSpaceGuid.PcdArmArchTimerIntrNum|14
  gArmTokenSpaceGuid.PcdArmArchTimerVirtIntrNum|11
  gArmTokenSpaceGuid.PcdArmArchTimerHypIntrNum|10
  gArmTokenSpaceGuid.PcdGicDistributorBase|0x0c000000
  gArmTokenSpaceGuid.PcdGicRedistributorsBase|0x0c100000
  gArmTokenSpaceGuid.PcdGicInterruptInterfaceBase|0x0c400000

  gEfiMdeModulePkgTokenSpaceGuid.PcdAcpiDefaultOemRevision|0x00008167
  gEmbeddedTokenSpaceGuid.PcdInterruptBaseAddress|0x0c400000

  gMediatekPkgTokenSpaceGuid.PcdSmbiosProcessorModel|"Mediatek (TM) MT8167 @ 1.50 GHz"
  gMediatekPkgTokenSpaceGuid.PcdSmbiosProcessorRetailModel|"MT8167"

  gArmPlatformTokenSpaceGuid.PcdCoreCount|4  #4 core
  gArmPlatformTokenSpaceGuid.PcdClusterCount|1

[LibraryClasses.common]
  GpioLib|Silicon/Mediatek/MT8167Pkg/Library/GpioLib/GpioLib.inf
  PlatformPeiLib|MT8167Pkg/Library/PlatformPeiLib/PlatformPeiLib.inf
  PlatformPrePiLib|MT8167Pkg/Library/PlatformPrePiLib/PlatformPrePiLib.inf
  HwResetSystemLib|ArmPkg/Library/ArmSmcPsciResetSystemLib/ArmSmcPsciResetSystemLib.inf
  ResetSystemLib|ArmPkg/Library/ArmSmcPsciResetSystemLib/ArmSmcPsciResetSystemLib.inf

[Components.common]
  MT8167Pkg/Drivers/SmBiosTableDxe/SmBiosTableDxe.inf

!include MediatekPkg/MediatekPkg.dsc.inc
