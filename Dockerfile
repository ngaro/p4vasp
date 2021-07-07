FROM ubuntu:18.04

ARG UNAME=user
ARG UID=1000
ARG GID=1000
ARG REPOUSER=ngaro
ARG REPO=p4vasp
ARG BRANCH=docker

RUN groupadd -g $GID -o $UNAME && useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME

WORKDIR /root
RUN apt-get update && apt-get -y full-upgrade && \
 apt-get -y install wget unzip make python g++ libfltk1.3-dev python-dev libxrender-dev libxcursor-dev libxft-dev libxinerama-dev python-gtk2 python-numpy python-glade2 && \
 apt-get autoremove && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/${REPOUSER}/${REPO}/archive/refs/heads/${BRANCH}.zip && unzip ${BRANCH}.zip && rm ${BRANCH}.zip
RUN cd /root/${REPO}-${BRANCH} && perl -pi -e 's/sudo //g' install.sh && ./install.sh && rm -rf /root/${REPO}-${BRANCH}

USER $UNAME
RUN mkdir /home/${UNAME}/p4vdata
WORKDIR /home/${UNAME}/p4vdata
CMD ["p4v"]
