# Docker image to build the binary
FROM golang:alpine

ARG UID=1000
ARG GID=1000

RUN apk add --no-cache shadow ninja make gcc musl-dev

RUN groupadd -o -g $GID user \
  && useradd -M -o -g $GID -u $UID user

WORKDIR "/project"
CMD ["make", "all"]
VOLUME ["/project"]

USER user
