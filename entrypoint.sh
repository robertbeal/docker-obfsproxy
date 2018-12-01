#!/bin/sh
set -e

if [ "$(id -u)" = '0' ]; then
    exec su-exec obfsproxy obfsproxy "$@"
fi

exec "$@"
