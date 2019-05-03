FROM ubuntu:16.04

LABEL maintainer="Sasan Jafarnejad <sasan@jafarnejad.io>"
LABEL version="1.0"

RUN groupadd -g 999 espuser && \
    useradd -r -u 999 -g espuser espuser

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y git make unrar-free autoconf automake \
     libtool gcc g++ gperf flex bison texinfo gawk \
     ncurses-dev libexpat-dev python-dev python python-serial \
     sed git unzip bash help2man wget bzip2 libtool-bin \
     && rm -rf /var/lib/apt/lists/*

RUN mkdir /sdk && chown -R espuser:espuser /sdk

USER espuser

WORKDIR /tmp

RUN git clone --recursive https://github.com/pfalcon/esp-open-sdk.git && \
    cd esp-open-sdk \
    && make STANDALONE=y \
    && mv xtensa-lx106-elf /sdk/ \
    && mv sdk /sdk/ \
    && cd .. \
    && rm -rf esp-open-sdk

ENV PATH="/sdk/xtensa-lx106-elf/bin:${PATH}"
VOLUME /code

WORKDIR /code
