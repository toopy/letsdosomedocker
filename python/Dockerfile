
FROM debian:latest
MAINTAINER Florent Pigout "florent@toopy.org"

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y git python2.7 python-pip python-psycopg2
RUN pip install "django<1.7"
