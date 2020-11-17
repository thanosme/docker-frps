FROM alpine:latest
MAINTAINER thanos_me <thanosme@totallynoob.com>

ENV FRPS_VERSION  "0.34.2"
ENV FRP_PLATFORM amd64
ENV FRP_MODE s
RUN apk add --no-cache --update wget \
 && wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRPS_VERSION}/frp_${FRPS_VERSION}_linux_${FRP_PLATFORM}.tar.gz \
 && tar zxvf frp_${FRPS_VERSION}_linux_${FRP_PLATFORM}.tar.gz \
 && mv frp_${FRPS_VERSION}_linux_${FRP_PLATFORM}/frp${FRP_MODE} /usr/local/bin/ \
 && rm -r frp_${FRPS_VERSION}_linux_${FRP_PLATFORM}* \
 && chmod +x /usr/local/bin/frp${FRP_MODE}

VOLUME /data
ENTRYPOINT /usr/local/bin/frp${FRP_MODE} -c /data/frp${FRP_MODE}.ini
