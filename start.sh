#!/bin/sh
col1="--- $0 ---"

echo "${col1}"

#if [ -n "${GID_AUDIO}" ]; then
#    addgroup -g ${GID_AUDIO} audio2
#    adduser mpd audio2
#fi

if [ ! -f /init_enable ]; then
        echo "${col1} container : init"
        touch /init_enable
        if [ ! -f "/mpd/conf/mpd.conf" ]; then
                cp /etc/mpd.conf /mpd/conf/mpd.conf
        fi
        #chown -R mpd:audio /mpd && chown -R mpd:audio /run/mpd/
        #chown -R mpd:audio /mpd && chown -R mpd:audio /run/mpd/
else
        echo "${col1} container : restart"
fi



/usr/bin/mpd --no-daemon --stdout /mpd/conf/mpd.conf