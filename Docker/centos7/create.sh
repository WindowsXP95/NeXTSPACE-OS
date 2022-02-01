#!/bin/bash
docker build -t nextspace-dev .
docker create  -v /dev:/dev --privileged=true -ti  --name nextspace-dev nextspace-dev:latest
docker start nextspace-dev
docker exec -w / -it nextspace-dev git clone https://github.com/WindowsXP95/NeXTSPACE-Live.git
docker exec -w /NeXTSPACE-Live -it nextspace-dev sh /v1/build.sh
docker cp nextspace-dev:/NeXTSPACE-Live/NEXTSPACEOS_v1.0.1.iso ~/NEXTSPACEOS_v1.0.1.iso
docker stop nextspace-dev
docker container rm nextspace-dev
