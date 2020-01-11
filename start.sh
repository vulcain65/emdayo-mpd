#!/bin/sh
echo "--- $0"

if [ -n "${GID_AUDIO}" ]; then
    addgroup -g ${GID_AUDIO} audio2
    adduser mpd audio2
fi

if [ ! -f "/mpd/conf/mpd.conf" ]; then
    cp addgroup -g ${GID_AUDIO} audio2
    adduser mpd audio2
fi


chown -R mpd:audio /mpd && chown -R mpd:audio /run/mpd/

/usr/bin/mpd --no-daemon --stdout /mpd/conf/mpd.conf
