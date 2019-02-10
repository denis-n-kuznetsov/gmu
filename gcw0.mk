#
# Gmu Music Player
#
# Copyright (c) 2013-2018 Denis Kuznetsov (denis.n.kuznetsov@gmail.com)
#
# File: gcw0.mk  Created: 131018
#
# Description: Makefile configuration (GCW Zero)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; version 2 of
# the License. See the file COPYING in the Gmu's main directory
# for details.
#

DECODERS_TO_BUILD  = \
                     decoders/vorbis.so \
                     decoders/flac.so \
                     decoders/mikmod.so \
                     decoders/mpg123.so \

FRONTENDS_TO_BUILD = \
                     frontends/sdl.so \
                     frontends/gmuhttp.so \

GCW0_SDK          ?= /opt/gcw0-toolchain/
SYSROOT_BIN        = usr/mipsel-gcw0-linux-uclibc/sysroot/usr/bin/
TOOLS_TO_BUILD     =
SDL_LIB            = `$(GCW0_SDK)$(SYSROOT_BIN)sdl-config --libs`
SDL_CFLAGS         = `$(GCW0_SDK)$(SYSROOT_BIN)sdl-config --cflags`
CXX                = $(GCW0_SDK)usr/bin/mipsel-linux-g++
CC                 = $(GCW0_SDK)usr/bin/mipsel-linux-gcc
STRIP              = $(GCW0_SDK)usr/bin/mipsel-linux-strip

COPTS             ?= -O2

CFLAGS             = \
                     $(SDL_CFLAGS) \
                     -fomit-frame-pointer -ffunction-sections -ffast-math \
                     -I$(GCW0_SDK)include/ \
                     -DFILE_HW_H="\"hw_gcw0.h\"" \

LFLAGS             = \
                     $(SDL_LIB) \
                     -lm -ldl -lz -lgcc -Wl,-export-dynamic \

DISTFILES          = \
                     $(BINARY) frontends decoders themes \
                     libs.gcw0 \
                     gmu.bmp gmu.png README.txt COPYING \
                     htdocs \
                     gmu-gcw0.dge gmuinput.gcw0.conf default.gcw0.desktop \

