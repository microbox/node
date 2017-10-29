FROM alpine:3.6
MAINTAINER Ling <x@e2.to>
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION} HOME=/home/user
ADD usr/local/bin/node /bin
RUN adduser -u 1000 -g user -h /home/user -s /bin/bash -D user && \
    apk add --no-cache --update ca-certificates libstdc++ bash && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/node /usr/bin/npm /usr/lib/node_modules
USER user
WORKDIR /home/user
# EOF