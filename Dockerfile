
FROM debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get install sudo python3 openssl -y

RUN useradd -m -p "`openssl passwd -crypt mypw`" -s /bin/bash testuser
RUN usermod -aG sudo testuser

USER testuser

WORKDIR /home/testuser/