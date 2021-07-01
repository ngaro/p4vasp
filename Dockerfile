FROM ubuntu:20.04
ENV TZ=Europe/Brussels
WORKDIR /root
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get -y install wget make python2 g++ libfltk1.3-dev python2-dev libxrender-dev libxcursor-dev libxinerama-dev unzip libxft-dev && \
wget https://github.com/ngaro/p4vasp/archive/refs/heads/docker.zip && \
unzip docker.zip && rm docker.zip && \
wget http://archive.ubuntu.com/ubuntu/pool/universe/p/pygtk/python-gtk2_2.24.0-5.1ubuntu2_amd64.deb && \
apt-get -y install ./python-gtk2_2.24.0-5.1ubuntu2_amd64.deb && rm ./python-gtk2_2.24.0-5.1ubuntu2_amd64.deb && \
cd /root/p4vasp-docker && make config && make install && \
cd /root && rm -rf /root/p4vasp-docker
WORKDIR /root
CMD ["p4v"]
