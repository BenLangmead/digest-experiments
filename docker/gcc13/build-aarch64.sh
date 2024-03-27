#!/bin/sh

NM="digest"
TOOL=$(pwd | awk -v FS='/' '{print $NF}')
docker build --platform linux/aarch64 -t "${NM}-${TOOL}-aarch64" .
