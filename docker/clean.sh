#!/bin/bash

for arch in amd64 aarch64 ; do
    for comp in clang11 gcc9 gcc10 gcc11 gcc12 gcc13 ; do
        rm -rf ${comp}/digest-${arch}
    done
done

