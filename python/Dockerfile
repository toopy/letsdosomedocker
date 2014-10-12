FROM debian:latest
MAINTAINER Florent Pigout "florent@toopy.org"

RUN apt-get update; apt-get upgrade -y

RUN apt-get install -y gcc git libssl-dev libpq-dev make openssl wget zip zlib1g-dev

RUN mkdir /build; cd /build; wget https://www.python.org/ftp/python/3.4.2/Python-3.4.2.tar.xz
RUN cd /build; tar xvf Python-3.4.2.tar.xz
RUN cd /build/Python-3.4.2; ./configure; make; make install

# add python symlink just in case
RUN ln -s /usr/local/bin/python3 /usr/local/bin/python

# install virtualenvs for coming users
RUN pip3 install virtualenvwrapper

# set root password for user switching
RUN echo 'root:toor' | chpasswd

# set an user
RUN useradd -U -d /home/toopy -s /bin/bash toopy; echo 'toopy:toopy' | chpasswd
RUN mkdir -p /home/toopy; chown toopy:toopy /home/toopy

# switch to user toopy
USER toopy

# setup virtualenvwrapper
ENV WORKON_HOME /home/toopy/.virtualenvs
ENV VIRTUALENVWRAPPER_HOOK_DIR /home/toopy/.virtualenvs
RUN cd /home/toopy; echo "\
export WORKON_HOME=$HOME/.virtualenvs\n
export VIRTUALENVWRAPPER_HOOK_DIR=$HOME/.virtualenvs\n
source /usr/local/bin/virtualenvwrapper.sh\
" > .bashrc
