FROM debian:stable-slim
RUN apt-get update && apt-get install -yq fontconfig fonts-dejavu && rm -r /var/lib/apt/lists/* \
    groupadd -r microbox && useradd -r -g microbox -G audio,video -d /home -m -s /bin/bash microbox
USER microbox
ENV CHROMIUM_HEADLESS_SHELL_VERSION=63.0.3230.2 NODE_VERSION=8.8.1
ADD ./node-v8.8.1-linux-x64/bin/node              /bin
ADD chrome.tar                                    /
ADD nss.tar                                       /usr/lib/x86_64-linux-gnu
ADD ./lib/x86_64-linux-gnu/libexpat.so.1          /lib/x86_64-linux-gnu
ADD ./usr/lib/x86_64-linux-gnu/libnss3.so         /usr/lib/x86_64-linux-gnu
ADD ./usr/lib/x86_64-linux-gnu/libnssutil3.so     /usr/lib/x86_64-linux-gnu
ADD ./usr/lib/x86_64-linux-gnu/libsmime3.so       /usr/lib/x86_64-linux-gnu
ADD ./usr/lib/x86_64-linux-gnu/libnspr4.so        /usr/lib/x86_64-linux-gnu
ADD ./usr/lib/x86_64-linux-gnu/libplc4.so         /usr/lib/x86_64-linux-gnu
ADD ./usr/lib/x86_64-linux-gnu/libplds4.so        /usr/lib/x86_64-linux-gnu
ADD ./usr/lib/x86_64-linux-gnu/libsqlite3.so.0    /usr/lib/x86_64-linux-gnu
