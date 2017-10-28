FROM alpine:3.6
MAINTAINER Ling <x@e2.to>
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION}

RUN apk add --no-cache --update nodejs ca-certificates bash && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/npm /usr/lib/node_modules
ADD ./usr/bin/node /usr/bin

# EOF