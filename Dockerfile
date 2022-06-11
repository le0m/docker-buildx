###
# Fetch buildx
###
FROM alpine AS fetcher

ARG BUILDX_VERSION=0.8.2

RUN apk add wget \
    && wget -O /docker-buildx "https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-amd64" \
    && chmod a+x /docker-buildx

###
# Build
###
FROM docker:20.10

COPY --from=fetcher /docker-buildx /usr/lib/docker/cli-plugins/docker-buildx
ENV DOCKER_BUILDKIT=1
