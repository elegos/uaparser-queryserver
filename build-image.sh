#!/usr/bin/env bash

docker build \
	--tag uaparser-build \
	--build-arg UID=`id -u` \
	--build-arg GID=`id -g` .

