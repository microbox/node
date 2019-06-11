FROM alpine:edge
MAINTAINER Ling <x@e2.to>
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION}

# for local compile node binary
ADD usr/bin/node /usr/bin/node
RUN apk add --no-cache --update c-ares ca-certificates http-parser libcrypto1.1 libgcc libssl1.1 libstdc++ libuv musl zlib && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/npm /usr/lib/node_modules

# for pre compiled node binary
#RUN apk add --no-cache --update nodejs>=${NODE_VERSION} && \
#    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/npm /usr/lib/node_modules

# for upstream image run as user, do not include in default
# RUN adduser -u 1000 -g node -h /home/node -s /bin/sh -D node
# USER node
# ENV HOME=/home/node
# WORKDIR /home/node
# EOF
