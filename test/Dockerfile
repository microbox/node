FROM node:12.13.1-alpine AS builder

FROM alpine:edge

MAINTAINER Ling <x@e2.to>
ARG NODE_VERSION
ENV NODE_VERSION=${NODE_VERSION}

RUN apk add --no-cache --update libgcc libstdc++ && \
    rm -rf /usr/share/man /tmp/* /var/cache/apk/*

# for local compile node binary
COPY --from=builder /usr/local/bin/node /usr/bin
