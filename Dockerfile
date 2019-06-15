#FROM alpine:edge AS builder
#RUN apk add --no-cache \
#        libstdc++ \
#    && apk add --no-cache --virtual .build-deps \
#        binutils-gold \
#        zlib-dev \
#        libuv-dev \
#        openssl-dev \
#        c-ares-dev \
#        http-parser-dev \
#        curl \
#        g++ \
#        gcc \
#        gnupg \
#        libgcc \
#        linux-headers \
#        make \
#        python
#
## gpg keys listed at https://github.com/nodejs/node#release-team
#RUN for key in \
#    94AE36675C464D64BAFA68DD7434390BDBE9B9C5 \
#    FD3A5288F042B6850C66B31F09FE44734EB7990E \
#    71DCFD284A79C3B38668286BC97EC7A07EDE3FC1 \
#    DD8F2338BAE7501E3DD5AC78C273792F7D83545D \
#    C4F0DFFF4E8C1A8236409D08E73BC641CC11F4C8 \
#    B9AE9905FFD7803F25714661B63B535A4C206CA9 \
#    56730D5401028683275BD23C23EFEFE93C4CFFFE \
#    4ED778F539E3634C779C87C6D7062848A1AB005C \
#    77984A986EBC2AA786BC0F66B01FBB92821C587A \
#    8FCCA13FEF1D0C2E91008E09770F7A9A5AE15600 \
#    A48C2BEE680E841632CD4E44F07496B3EB3C1762 \
#    B9E2F5981AA6E0CD28160D9FF13993A75599653C \
#  ; do \
#    gpg --batch --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key" || \
#    gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
#    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
#  done
# RUN curl -SLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION.tar.xz" \
#    && curl -SLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/SHASUMS256.txt.asc" \
#    && gpg --batch --decrypt --output SHASUMS256.txt SHASUMS256.txt.asc \
#    && grep " node-v$NODE_VERSION.tar.xz\$" SHASUMS256.txt | sha256sum -c - \
#    && tar -xf "node-v$NODE_VERSION.tar.xz"

ARG NODE_VERSION
FROM microbox/node-source:${NODE_VERSION} AS builder
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION}

RUN cd "node-v$NODE_VERSION" \
    && ./configure --no-cross-compiling \
                   --openssl-use-def-ca-store \
                   --shared-zlib \
                   --shared-openssl
    && make -j2 \
    && cd out/Release \
    && cp /node-v$NODE_VERSION/out/Release/node /usr/bin/node

# toooooooooo slow
#RUN apk add upx && upx /node-v$NODE_VERSION/out/Release/node

FROM alpine:edge

MAINTAINER Ling <x@e2.to>
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION}

RUN apk add --no-cache --update libgcc libstdc++ && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/*

# for local compile node binary
COPY --from=builder /usr/bin/node /usr/bin

#RUN apk add --no-cache --update ca-certificates && \
#    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/npm /usr/lib/node_modules

# for pre compiled node binary
#RUN apk add --no-cache --update nodejs>=${NODE_VERSION} && \
#    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/npm /usr/lib/node_modules

# for upstream image run as user, do not include in default
# RUN adduser -u 1000 -g node -h /home/node -s /bin/sh -D node
# USER node
# ENV HOME=/home/node
# WORKDIR /home/node
# EOF
