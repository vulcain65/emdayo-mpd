#FROM alpine:3.10
FROM alpine

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
	&& mkdir -p /mpd/conf/ /mpd/music /mpd/playlists /mpd/data /run/mpd/ \
	&& chown mpd:audio /mpd /mpd/conf /mpd/music /mpd/playlists /mpd/data \
	&& chown -R mpd:audio /run/mpd/

COPY /etc/mpd.conf /mpd/conf/mpd-dist.conf
COPY start.sh /start.sh

VOLUME ["/mpd/conf","/mpd/music","/mpd/playlists","/mpd/data","/run/mpd"]

EXPOSE 6600 8000

ENTRYPOINT ["/bin/sh"]
CMD ["/start.sh"]