# docker-obfsproxy

Docker-ised version of obfsproxy, for "stealth" VPNing

# Getting running

```
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
