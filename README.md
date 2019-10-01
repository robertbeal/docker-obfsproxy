[![Build Status](https://travis-ci.org/robertbeal/docker-obfsproxy.svg?branch=master)](https://travis-ci.org/robertbeal/obfsproxy)
[![](https://images.microbadger.com/badges/image/robertbeal/obfsproxy.svg)](https://microbadger.com/images/robertbeal/obfsproxy "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/robertbeal/obfsproxy.svg)](https://microbadger.com/images/robertbeal/obfsproxy "Get your own version badge on microbadger.com")
[![](https://img.shields.io/docker/pulls/robertbeal/obfsproxy.svg)](https://hub.docker.com/r/robertbeal/obfsproxy/)
[![](https://img.shields.io/docker/stars/robertbeal/obfsproxy.svg)](https://hub.docker.com/r/robertbeal/obfsproxy/)
[![](https://img.shields.io/docker/automated/robertbeal/obfsproxy.svg)](https://hub.docker.com/r/robertbeal/obfsproxy/)

# obfsproxy

Container-ised, multi-arch version of obfsproxy, for "stealth" VPNing

# usage

```bash
docker run \
    --init \
    --rm \
    --name obfsproxy \
    --read-only \
    -p 1050:1050 \
    --pids-limit 100 \
    --security-opt="no-new-privileges:true" \
    --health-cmd="netstat -ltu | grep 0.0.0.0:1050" \
    --health-interval=5s \
    --health-retries=3 \
    --health-start-period=45s \
    robertbeal/obfsproxy --help

docker run \
    --init \
    --rm \
    --name obfsproxy \
    --read-only \
    -p 1050:1050 \
    --pids-limit 100 \
    --security-opt="no-new-privileges:true" \
    --health-cmd="netstat -ltu | grep 0.0.0.0:1050" \
    --health-interval=5s \
    --health-retries=3 \
    --health-start-period=45s \
    robertbeal/obfsproxy obfs3 socks 0.0.0.0:1050
```
