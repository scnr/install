# syntax=docker/dockerfile:1
FROM ubuntu:22.04

RUN groupadd -g 1234 codename-scnr-group
RUN useradd -m -u 1234 -g codename-scnr-group codename-scnr
 
USER codename-scnr
 
WORKDIR /home/codename-scnr

RUN mkdir .scnr
RUN echo '#!/usr/bin/env bash' > ./install.sh
RUN echo 'bash -c "$(curl -sSL https://get.ecsypno.com/scnr)" _ docker' >> ./install.sh
RUN chmod +x ./install.sh

USER root

RUN apt-get update
RUN apt-get install -y nano tzdata less curl libgconf-2-4 libatk1.0-0 libatk-bridge2.0-0 libgdk-pixbuf2.0-0 libgtk-3-0 \
  libgbm-dev libnss3-dev libxss-dev libasound2

USER codename-scnr