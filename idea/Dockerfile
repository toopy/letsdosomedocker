FROM toopy/java:latest
MAINTAINER Florent Pigout "florent@toopy.org"

USER root

RUN mkdir -p /root/tools
WORKDIR /root/tools

RUN wget http://download-cf.jetbrains.com/idea/ideaIC-14.0.3.tar.gz
RUN tar xvf ideaIC-14.0.3.tar.gz
RUN mv /root/tools/idea-* /root/tools/idea

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
CMD /root/tools/idea/bin/idea.sh
