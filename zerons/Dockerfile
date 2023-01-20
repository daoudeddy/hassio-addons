ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH

RUN apt update && apt install wget tar openssl ca-certificates
RUN wget "https://github.com/daoudeddy/zerons-addon/releases/latest/download/zeronsd-${BUILD_ARCH}.tar.gz" -O zeronsd.tar.gz
RUN tar xvf zeronsd.tar.gz && rm zeronsd.tar.gz
RUN cp /zeronsd /usr/bin/zeronsd && rm /zeronsd

COPY rootfs /
