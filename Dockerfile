FROM gcc

# Install required build tools
RUN apt-get update && apt-get install -y \
    autoconf \
    automake \
    libtool \
    pkg-config \
    make \
    && rm -rf /var/lib/apt/lists/*

COPY . /usr/src/twemproxy
WORKDIR /usr/src/twemproxy

RUN autoreconf -fvi && \
    ./configure && \
    make && \
    make install

ENTRYPOINT ["nutcracker"]
