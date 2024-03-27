#!/bin/bash

set -ex

for comp in clang11 gcc9 gcc10 gcc11 gcc12 gcc13 ; do
  for arch in amd64 aarch64 ; do
    pushd "${comp}" && ./build-${arch}.sh && ./run-${arch}.sh && popd
    test -f "${comp}/log-${arch}.txt"
  done
done
