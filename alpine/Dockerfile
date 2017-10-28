FROM alpine:3.6
MAINTAINER Ling <x@e2.to>
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION}
ADD ./usr/bin/node /bin
RUN addgroup -g 1000 microbox && \
    adduser -u 1000 -g microbox -d /home -m -s /bin/bash microbox \
    apk add --no-cache --update nodejs ca-certificates bash && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg /usr/bin/node /usr/bin/npm /usr/lib/node_modules
USER microbox
# EOF