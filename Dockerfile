FROM alpine:3.7
MAINTAINER Rob Beal <rob@kohi.uk>

RUN adduser -D -s /bin/false -H obfsproxy \
  && apk add --no-cache --virtual=build-dependencies \
    build-base \
    gmp-dev \
    python-dev \
  && apk add --no-cache \
    python \
    py-pip \
    su-exec \
    tini \
  && pip install --upgrade pip \
  && pip install obfsproxy \
  && apk del --purge build-dependencies \
  && rm -rf /tmp/*

COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["/sbin/tini", "--", "entrypoint.sh"]
CMD ["obfsproxy", "-h"]