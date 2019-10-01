FROM alpine:latest
LABEL maintainer="github.com/robertbeal"

ARG VERSION=0.2.13

RUN adduser -D -s /bin/false -H obfsproxy \
  && apk add --no-cache --virtual=build-dependencies \
  build-base \
  gmp-dev \
  python-dev \
  && apk add --no-cache \
  python \
  py-pip \
  su-exec \
  && pip install --no-cache-dir --upgrade pip \
  && pip install --no-cache-dir obfsproxy==$VERSION \
  && apk del --purge build-dependencies \
  && rm -rf /tmp/*

HEALTHCHECK --interval=30s --retries=3 CMD netstat -ltu | grep 0.0.0.0:1050

COPY entrypoint.sh /usr/local/bin
RUN chmod 555 /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
CMD ["--help"]
