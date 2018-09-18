# 
# Gmu Music Player
#
# Copyright (c) 2006-2012 Johannes Heimansberg (wejp.k.vu)
#
# File: dingoo-native.mk  Created: 120719
#
# Description: Makefile configuration (Dingoo µCOS-II target)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; version 2 of
# the License. See the file COPYING in the Gmu's main directory
# for details.
#

#DECODERS_TO_BUILD=decoders/vorbis.so decoders/musepack.so decoders/flac.so decoders/wavpack.so decoders/mpg123.so decoders/mikmod.so
DECODERS_TO_BUILD?=vorbis.o mikmod.o
FRONTENDS_TO_BUILD?=sdl.o
CC=/opt/dingoo-sdk/mipsel-4.1.2-nopic/bin/mipsel-linux-gcc
CXX=/opt/dingoo-sdk/mipsel-4.1.2-nopic/bin/mipsel-linux-g++
STRIP=/opt/dingoo-sdk/mipsel-4.1.2-nopic/bin/mipsel-linux-strip

SDL_LIB=-lSDL
SDL_CFLAGS=
#MIKMOD_LIB=$(shell libmikmod-config --libs)
#MIKMOD_CFLAGS=$(shell libmikmod-config --cflags)

INCLUDE   = -I$(DINGOO_SDK)/include -I$(DINGOO_SDK)/include/SDL -I$(DINGOO_SDK)/include/stlport
#COPTS?=-O2 -finline-functions -fno-short-enums
CFLAGS=$(SDL_CFLAGS) -G0 -O3 $(INCLUDE) -Wall -Wextra -finline-functions -fomit-frame-pointer -msoft-float -fno-builtin -fno-exceptions -mips32 -mno-abicalls -fno-pic -DMPU_JZ4740 -DNDEBUG -D_DINGOO
LFLAGS=-L$(DINGOO_SDK)/lib -Wl,-export-dynamic -lSDL -ltremor -lmikmod -lfreetype -lpng -lz -lm -lsml -lc -ljz4740 -lgcc
DISTFILES=$(COMMON_DISTBIN_FILES) gmuinput.dingoo.conf

LD_SCRIPT = $(DINGOO_SDK)/lib/dingoo.xn
LD_OPTS   = -nodefaultlibs --script $(LD_SCRIPT) $(LFLAGS) -o gmu.elf
