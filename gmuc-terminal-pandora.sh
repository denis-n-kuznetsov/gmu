#!/bin/sh
# This script is to be called from gmuc-pandora.sh
cd `dirname $0`
LD_LIBRARY_PATH=libs.pandora/ TERMINFO_DIRS=libs.pandora/terminfo ./gmuc -c gmuc.pandora.conf
killall gmu.bin
