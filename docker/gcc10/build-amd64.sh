#!/bin/sh

NM="digest"
TOOL=$(pwd | awk -v FS='/' '{print $NF}')
docker build --platform linux/amd64 -t "${NM}-${TOOL}-amd64" .
