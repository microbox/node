Node.js Minimal Image
=====================

[![Build Status](https://travis-ci.org/microbox/node.svg?branch=master)](https://travis-ci.org/microbox/node)

This is an [automated build](https://hub.docker.com/r/microbox/node) for 12.x, 10.x, 8.x nodejs.

### What's inside?

1. Alpine Linux Edge
2. NodeJS Binary

### Size

|Name   |Version   |Size   |
|---|---|---|
|microbox/node|8.16.0| 39.4MB |
|microbox/node|10.16.0| 44.6MB |
|microbox/node|12.4.0| 48.3MB |

### Performance

Node snapshot is enabled for 12.x version. It have better performance then official nodejs alpine image.

### Q&A

#### Q: Why not compress the nodejs binary using UPX?
1. Docker will compress the image during transfer. 
2. It will increase the booting time from 30ms to 300ms.
3. You always can create your own image with compressed nodejs binary from this base image.