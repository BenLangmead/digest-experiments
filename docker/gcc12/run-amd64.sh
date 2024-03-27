#!/bin/bash

set -ex

NM="digest"
TOOL=$(pwd | awk -v FS='/' '{print $NF}')
PLAT=amd64
REPO=$(cat ../repo.txt)
BRANCH=$(cat ../branch.txt)

if [[ ! -d "${NM}-${PLAT}" ]] ; then
  git clone -b "${BRANCH}" "${REPO}" -- "${NM}-${PLAT}"
fi

docker run -it -v`pwd`/${NM}-${PLAT}:/code --platform linux/${PLAT} \
  ${NM}-${TOOL}-${PLAT} \
  /bin/bash -c "cd /code && (meson setup --prefix=/code/install-root --buildtype=debug build && meson install -C build && meson install) 2>&1 | tee log-${PLAT}.txt"

LOGFN="${NM}-${PLAT}/log-${PLAT}.txt"
test -f "${LOGFN}"
cp "${LOGFN}" .
