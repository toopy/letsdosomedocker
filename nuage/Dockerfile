FROM toopy/python
MAINTAINER Florent Pigout florent@toopy.org


RUN mkdir -p /var/toopy/src; cd /var/toopy/src; git clone https://github.com/open-nuage/django-nuage-server.git

ADD files/settings_local.py       /var/toopy/src/django-nuage-server/
ADD files/settings_tests_local.py /var/toopy/src/django-nuage-server/

ADD files/run.sh /var/toopy/bin/
CMD /var/toopy/bin/run.sh
