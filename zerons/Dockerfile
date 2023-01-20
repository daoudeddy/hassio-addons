ARG BUILD_FROM
FROM $BUILD_FROM

ARG BUILD_ARCH

RUN apt-get -y update && apt-get -y install wget tar openssl ca-certificates
RUN wget "https://github.com/daoudeddy/zerons-addon/releases/latest/download/zeronsd-${BUILD_ARCH}.tar.gz" -O zeronsd.tar.gz
RUN tar xvf zeronsd.tar.gz && rm zeronsd.tar.gz
RUN cp /zeronsd /usr/bin/zeronsd && rm /zeronsd
RUN chmod +x rootfs/etc/cont-init.d/zerons.sh
RUN chmod +x rootfs/etc/services.d/zerons/run
RUN chmod +x rootfs/etc/services.d/zerons/finish

COPY rootfs /
