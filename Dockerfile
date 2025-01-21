FROM ubuntu:24.04

RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y \
    autoconf \
    bison \
    build-essential \
    cmake \
    curl \
    default-jdk \
    dnsutils \
    file \
    gawk \
    gdb \
    gdb-multiarch \
    git \
    iputils-ping \
    libdb-dev \
    libffi-dev \
    libssl-dev \
    libxaw7-dev \
    libxt-dev \
    ltrace \
    make \
    nasm \
    net-tools \
    netcat-openbsd \
    patchelf \
    procps \
    python3-dev \
    python3-pip \
    rpm2cpio cpio \
    socat \
    software-properties-common \
    strace \
    sudo \
    tmux \
    vim \
    wget \
    fish \
    zstd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

RUN useradd -ms /usr/bin/fish -G sudo ctf
RUN mkdir /tools
RUN chown ctf:ctf /tools
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ctf

WORKDIR /home/ctf/work

RUN wget -O ~/.gdbinit-gef.py -q http://gef.blah.cat/py


