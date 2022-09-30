FROM uhub.service.ucloud.cn/outer/alpine:latest as certs

RUN apk --update add ca-certificates

FROM uhub.service.ucloud.cn/outer/buildbase:v1.0.0

SHELL ["/busybox/sh", "-c"]

COPY entrypoint.sh /
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["/entrypoint.sh"]

LABEL repository="https://github.com/aevea/action-kaniko" \
    maintainer="Alex Viscreanu <alexviscreanu@gmail.com>"
