FROM debian:jessie

# Change Source
RUN sed -i 's/httpredir.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN sed -i 's|security.debian.org|mirrors.ustc.edu.cn/debian-security|g' /etc/apt/sources.list
RUN apt-get -y update && \
    apt-get -y install \
        git vim parted \
        quilt realpath qemu-user-static debootstrap zerofree pxz zip dosfstools \
        bsdtar libcap2-bin rsync grep \
    && rm -rf /var/lib/apt/lists/*

COPY . /pi-gen/

VOLUME [ "/pi-gen/work", "/pi-gen/deploy"]
