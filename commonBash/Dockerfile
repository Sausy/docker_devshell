ARG PLATFORM
ARG OS_VERSION
FROM --platform=linux/$PLATFORM ubuntu:$OS_VERSION

ARG ROS_DIST

COPY ./entry.sh /entry.sh
CMD bash -C '/entry.sh';'bash'

WORKDIR /home/userdev

RUN mkdir /data && \
    mkdir /common && \
    mkdir /common/lib && \
    apt-get update && \
    apt-get install -y sudo && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y -qq tzdata && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y keyboard-configuration && \
    apt-get install -y git nano curl man wget unzip tar gnupg2 && \
    apt-get install -y vim lsb-release lsb-core build-essential autoconf libtool cmake pkg-config && \
    #====== add user userdev:ubuntu ==== && \
    echo "root:ubuntu" | chpasswd && \
    useradd -ms /bin/bash userdev && \
    echo "userdev:ubuntu" | chpasswd && \
    adduser userdev sudo && \
    echo "userdev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    #===== change permissions === && \
    chown -R userdev:userdev /home/userdev
    #====== install python stuff ==== && \
    apt-get install -y python3-dev python3 python3-pip && \
    #apt-get install -y python-dev python-pip \
    apt-get install -y libssl-dev libffi-dev && \
    pip3 install --user --upgrade pip 

USER userdev
#WORKDIR /home/userdev
#CMD bash -C '/src/entry.sh';'bash'
