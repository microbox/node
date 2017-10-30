FROM alpine:edge
MAINTAINER Ling <x@e2.to>
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION} HOME=/home/node
ADD usr/bin/node /usr/bin
RUN apk add --no-cache --update ca-certificates libstdc++ && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/node /usr/bin/npm /usr/lib/node_modules
# for upstream image run as user
#adduser -u 1000 -g node -h /home/node -s /bin/sh -D node
#USER node
#WORKDIR /home/node
# EOF