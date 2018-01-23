#!/usr/bin/env bash

set -e

# Build builder image
docker build \
	--quiet \
	--tag uaparser-build \
	--build-arg UID=`id -u` \
	--build-arg GID=`id -g` .

# Compile
docker run --rm \
	-ti \
	-v "`pwd`:/project" \
	uaparser-build

# Build application image
docker build \
	--no-cache \
	--tag uaparser-queryserver \
	--file Dockerfile.app .
