FROM alpine:edge
MAINTAINER Ling <x@e2.to>
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION}
ADD usr/bin/node /usr/bin/node
RUN apk add --no-cache --update ca-certificates c-ares http-parser libuv libssl1.0 libstdc++ && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/npm /usr/lib/node_modules

# for upstream image run as user
# RUN adduser -u 1000 -g node -h /home/node -s /bin/sh -D node
# USER node
# ENV HOME=/home/node
# WORKDIR /home/node
# EOF