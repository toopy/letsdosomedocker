FROM toopy/java:latest
MAINTAINER Florent Pigout "florent@toopy.org"

RUN mkdir -p /home/toopy/tools
RUN cd /home/toopy/tools; wget http://download-cf.jetbrains.com/idea/ideaIC-13.1.5.tar.gz; tar xvf ideaIC-13.1.5.tar.gz
RUN rm /home/toopy/tools/ideaIC-13.1.5.tar.gz; mv /home/toopy/tools/idea-IC-135.1289 /home/toopy/tools/idea

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
CMD /var/toopy/tools/idea/bin/idea.sh
