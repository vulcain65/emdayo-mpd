FROM alpine:3.10

LABEL org.opencontainers.image.authors="" \
	org.opencontainers.image.title="MPD" \
	org.opencontainers.image.description="AlpineLinux with MPD" \
	org.opencontainers.image.licenses="" \
	org.opencontainers.image.url="" \
	org.opencontainers.image.source=""

RUN set -x && apk --no-cache add \
    alsa-utils \
	mpd \
	mpc \
	&& mkdir -p /mpd/conf/ && mkdir -p /mpd/music && mkdir -p /mpd/playlists && mkdir -p /mpd/data && mkdir -p /run/mpd/ \
	&& chown -R mpd:audio /mpd && chown -R mpd:audio /run/mpd/
# for use audio debian server
RUN set -x && addgroup -g 29 audio2
RUN set -x && adduser mpd audio2

COPY mpd.conf /mpd/conf/mpd.conf
COPY start.sh /start.sh

VOLUME ["/mpd/conf","/mpd/music","/mpd/playlists","/mpd/data","/run/mpd"]

EXPOSE 6600 8000

ENTRYPOINT ["/bin/sh"]
CMD ["/start.sh"]