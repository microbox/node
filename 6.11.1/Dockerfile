FROM alpine:edge
MAINTAINER Ling <e2tox@microbox.io>
ENV NODE_VERSION=6.11.1

RUN apk upgrade --update && \
    apk add --update nodejs=${NODE_VERSION}-r2 ca-certificates && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/npm /usr/lib/node_modules

# EOF
