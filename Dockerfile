FROM ubuntu:18.04
WORKDIR /root
RUN apt-get update && apt-get -y full-upgrade && \
 apt-get -y install wget unzip make python g++ libfltk1.3-dev python-dev libxrender-dev libxcursor-dev libxft-dev libxinerama-dev python-gtk2 python-numpy python-glade2 && \
 apt-get autoremove && rm -rf /var/lib/apt/lists/*
RUN wget https://github.com/ngaro/p4vasp/archive/refs/heads/docker.zip && unzip docker.zip && rm docker.zip
RUN cd /root/p4vasp-docker && perl -pi -e 's/sudo //g' install.sh && ./install.sh && rm -rf /root/p4vasp-docker
CMD ["p4v"]
