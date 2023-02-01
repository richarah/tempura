FROM ubuntu:jammy

# Line by line:
# - Fix repository access via HTTPS
# - Update repositories
# - X11 utilities
# - Get build deps
# - Equivalent to dependency-getting .sh script provided assignment.

RUN apt-get install apt-transport-https -y && \
    apt-get update && apt-get upgrade -y && \
    apt-get install sudo apt-utils x11-apps -y && \
    apt-get install libvulkan-dev git build-essential gcc make cmake -y && \
    apt-get install libopenal-dev libvorbis-dev libflac-dev xorg-dev -y

# Add user with credentials from cmdline
ARG user
ARG uid
ARG gid

ENV USERNAME ${user}
RUN useradd -m $USERNAME && \
        echo "$USERNAME:$USERNAME" | chpasswd && \
        usermod --shell /bin/bash $USERNAME && \
        usermod  --uid ${uid} $USERNAME && \
        groupmod --gid ${gid} $USERNAME

RUN usermod -aG sudo $USERNAME
USER ${user}

WORKDIR /home/${user}
RUN git clone --recursive https://github.com/bartvbl/TDT4230-Assignment-1.git
WORKDIR /home/${user}/TDT4230-Assignment-1

CMD /bin/sh
