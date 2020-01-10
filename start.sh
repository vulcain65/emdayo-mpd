#!/bin/sh
echo $0

if [ -n "${GID_AUDIO}" ]; then
    addgroup -g ${GID_AUDIO} audio2
    adduser mpd audio2
fi
/usr/bin/mpd --no-daemon --stdout /mpd/conf/mpd.conf
