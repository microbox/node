#!/usr/bin/env sh

NODE_VERSION=8.12.0

apk add --no-cache \
        libstdc++ \
        zlib-dev \
        libuv-dev \
        openssl-dev \
        c-ares-dev \
        http-parser-dev

apk add --no-cache --virtual .build-deps \
        binutils-gold \
        curl \
        g++ \
        git \
        gcc \
        gnupg \
        libgcc \
        linux-headers \
        make \
        python

curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz"

tar -xf "node-v$NODE_VERSION.tar.xz"

cd "node-v$NODE_VERSION"

git apply --ignore-space-change --ignore-whitespace ../patchs/$NODE_VERSION.patch

./configure --no-cross-compiling \
            --openssl-use-def-ca-store \
            --shared-zlib \
            --shared-cares \
            --shared-http-parser \
            --shared-libuv \
            --shared-openssl
#           --without-snapshot \
#           --without-dtrace \
#           --without-etw

make -j2
