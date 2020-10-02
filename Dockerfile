FROM alpine AS fetcher

ARG BUILDX_VERSION=0.4.2

RUN apk add wget \
    && wget -O /docker-buildx "https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-amd64" \
    && chmod a+x /docker-buildx

FROM docker:19.03

COPY --from=fetcher /docker-buildx /usr/lib/docker/cli-plugins/docker-buildx
