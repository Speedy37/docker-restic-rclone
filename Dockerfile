FROM alpine:3.7

RUN apk add --no-cache git go musl-dev ca-certificates fuse \
 && go get -u -v github.com/ncw/rclone \
 && git clone https://github.com/Speedy37/restic.git \
 && cd restic && git checkout rclone \
 && go run build.go \
 && mv /root/go/bin/rclone /usr/local/bin/rclone \
 && mv restic /usr/local/bin/restic \
 && cd .. \
 && rm -r /root/go restic \
 && apk del git go musl-dev \
 && echo "DONE"

VOLUME ["/root/.config/rclone/"]
