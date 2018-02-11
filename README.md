# docker-obfsproxy

Docker-ised version of obfsproxy, for "stealth" VPNing

# Getting running

```
docker run \
    --rm
    --name obfsproxy \
    --read-only \
    -p 1050:1050 \
    robertbeal/obfsproxy --help
    
docker run \
    --rm
    --name obfsproxy \
    --read-only \
    -p 1050:1050 \
    robertbeal/obfsproxy obfs3 socks 0.0.0.0:1050
```
