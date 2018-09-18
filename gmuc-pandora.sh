#!/bin/sh
# This script starts Gmu headless and then runs gmuc which connects to Gmu
cd `dirname $0`

/usr/bin/xterm -e ./gmuc-terminal-pandora.sh &
LD_LIBRARY_PATH=libs.pandora/ ./gmu.bin -v 0 -c gmu.pandora.conf -p frontends/gmuhttp.so >/dev/null 2>&1

