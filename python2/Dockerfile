FROM debian:latest
MAINTAINER Florent Pigout "florent@toopy.org"

# install main packages
RUN apt-get update; apt-get upgrade -y; apt-get install -y git libpq-dev python2.7-dev wget

# add python symlink just in case
RUN ln -s /usr/bin/python2.7 /usr/bin/python

# install pip
RUN wget https://bootstrap.pypa.io/get-pip.py -O /tmp/get-pip.py; python /tmp/get-pip.py

# install virtualenvs for coming users
RUN pip install virtualenvwrapper

# set root password for user switching
RUN echo 'root:toor' | chpasswd

# set an user
RUN useradd -U -d /home/toopy -s /bin/bash toopy; echo 'toopy:toopy' | chpasswd
RUN mkdir -p /home/toopy; chown toopy:toopy /home/toopy

# switch to user toopy
USER toopy

# setup virtualenvwrapper
RUN cd /home/toopy; echo "\
export WORKON_HOME=$HOME/.virtualenvs\n\
export VIRTUALENVWRAPPER_HOOK_DIR=$HOME/.virtualenvs\n\
source /usr/local/bin/virtualenvwrapper.sh\
" > .bashrc
