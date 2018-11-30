FROM alpine:latest
MAINTAINER thanos_me <thanosme@totallynoob.com>

ENV FRPS_VERSION  "0.21.0"
RUN apk add --no-cache --update wget \
 && wget --no-check-certificate https://github.com/fatedier/frp/releases/download/v${FRPS_VERSION}/frp_${FRPS_VERSION}_linux_amd64.tar.gz \
 && tar zxvf frp_${FRPS_VERSION}_linux_amd64.tar.gz \
 && mv frp_${FRPS_VERSION}_linux_amd64/frps /usr/local/bin/ \
 && rm -r frp_${FRPS_VERSION}_linux_amd64* \
 && chmod +x /usr/local/bin/frps

VOLUME /data
ENTRYPOINT ["/usr/local/bin/frps", "-c", "/data/frps.ini"]
