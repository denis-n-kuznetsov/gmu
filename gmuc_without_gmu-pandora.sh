#!/bin/sh
# This script should be used, if you want to use gmuc to control a Gmu running on another computer/device
cd `dirname $0`/../share/gmu
LD_LIBRARY_PATH=../../libs.pandora/ TERMINFO_DIRS=../../libs.pandora/terminfo ../../bin/gmuc -c ../../etc/gmu/gmuc.conf
