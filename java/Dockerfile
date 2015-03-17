FROM debian:latest
MAINTAINER Florent Pigout "florent@toopy.org"

RUN apt-get update; apt-get upgrade -y
RUN apt-get install -y curl git openjdk-7-jdk unzip vim wget

# set root password for user switching
RUN echo 'root:toor' | chpasswd

# set an user
RUN useradd -U -d /home/toopy -s /bin/bash toopy; echo 'toopy:toopy' | chpasswd
RUN mkdir -p /home/toopy; chown toopy:toopy /home/toopy

# switch to user toopy
USER toopy
