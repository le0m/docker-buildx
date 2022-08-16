FROM docker:20.10

ARG BUILDX_VERSION=0.8.2
ADD "https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-amd64" /usr/lib/docker/cli-plugins/docker-buildx
RUN chmod a+x /usr/lib/docker/cli-plugins/docker-buildx
ENV DOCKER_BUILDKIT=1
