# Docker image to build the binary
FROM golang:1.9.2-stretch

ARG UID=1000
ARG GID=1000

RUN groupadd -o -g $GID user \
  && useradd -M -o -g $GID -u $UID user

RUN apt-get update \
  && apt-get install -y ninja-build

WORKDIR "/project"
CMD ["make", "all"]
VOLUME ["/project"]

USER user
