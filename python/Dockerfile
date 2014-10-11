FROM debian:latest
MAINTAINER Florent Pigout "florent@toopy.org"

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y gcc git libssl-dev libpq-dev make openssl wget zip zlib1g-dev

RUN mkdir /build; cd /build; wget https://www.python.org/ftp/python/3.4.2/Python-3.4.2.tar.xz
RUN cd /build; tar xvf Python-3.4.2.tar.xz
RUN cd /build/Python-3.4.2; ./configure; make; make install
