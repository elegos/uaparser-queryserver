#!/usr/bin/env bash

docker run --rm \
	-ti \
	-v "`pwd`:/project" \
	uaparser-build
