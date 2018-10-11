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

DECODERS_TO_BUILD  = decoders/vorbis.so decoders/flac.so decoders/wavpack.so\
                     decoders/mpg123.so decoders/mikmod.so
FRONTENDS_TO_BUILD = frontends/sdl.so frontends/log.so frontends/gmuhttp.so
GCW0_SDK          ?= /opt/gcw0-toolchain/
SYSROOT_USR        = usr/mipsel-gcw0-linux-uclibc/sysroot/usr/
TOOLS_TO_BUILD     =
SDL_LIB            = `$(GCW0_SDK)$(SYSROOT_USR)bin/sdl-config --libs`
SDL_CFLAGS         = `$(GCW0_SDK)$(SYSROOT_USR)bin/sdl-config --cflags`
CXX                = mipsel-linux-g++
CC                 = mipsel-linux-gcc
STRIP              = mipsel-linux-strip
COPTS             ?= -O2 -ffast-math
CFLAGS             = -fomit-frame-pointer $(SDL_CFLAGS) \
                     -I$(GCW0_SDK)include/ -DFILE_HW_H="\"hw_$(TARGET).h\""
LFLAGS             = -s $(SDL_LIB) -lm -ldl -lz -lgcc -Wl,-export-dynamic
DISTFILES          = $(BINARY) frontends decoders themes htdocs libs.gcw0 \
                     gmu.bmp gmu.png README.txt gmu-gcw0.dge COPYING \
                     gmuinput.gcw0.conf default.gcw0.desktop
