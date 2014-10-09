FROM toopy/django-1.6.7
MAINTAINER Florent Pigout florent@toopy.org

RUN mkdir -p /var/toopy/src

RUN git clone https://github.com/open-nuage/django-nuage-server.git /var/toopy/src/django-nuage-server

ADD files/settings_local.py /var/toopy/src/django-nuage-server/
ADD files/run.sh /var/toopy/bin/

CMD /var/toopy/bin/run.sh
