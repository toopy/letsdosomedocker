FROM toopy/python:3.4
MAINTAINER Florent Pigout florent@toopy.org

RUN cd /home/toopy; mkdir src; mkdir bin

RUN cd /home/toopy/src/; git clone https://github.com/open-nuage/django-nuage-server.git

ADD files/settings_local.py       /home/toopy/src/django-nuage-server/
ADD files/settings_tests_local.py /home/toopy/src/django-nuage-server/
ADD files/run.sh                  /home/toopy/bin/

CMD /home/toopy/bin/run.sh
