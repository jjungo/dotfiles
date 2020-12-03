FROM ubuntu

RUN apt update && apt install sudo -y

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER docker
WORKDIR /home/docker

#WORKDIR /root
COPY --chown=docker .vimrc .
COPY --chown=docker .aliases .
COPY --chown=docker install.sh .

RUN chmod +x install.sh && ./install.sh

COPY --chown=docker .zshrc .

ENV TERM=xterm-256color
