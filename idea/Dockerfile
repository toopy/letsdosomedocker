FROM debian:latest

RUN apt-get update; apt-get upgrade -y
RUN apt-get install -y curl git libxext-dev libxrender-dev libxtst-dev maven openjdk-7-jdk unzip vim wget xorg x11-apps

RUN mkdir -p /var/toopy/tools
RUN cd /var/toopy/tools; wget http://download-cf.jetbrains.com/idea/ideaIC-13.1.5.tar.gz; tar xvf ideaIC-13.1.5.tar.gz
RUN rm /var/toopy/tools/ideaIC-13.1.5.tar.gz; mv /var/toopy/tools/idea-IC-135.1289 /var/toopy/tools/idea

RUN mkdir -p /var/toopy/bin
RUN wget https://get.docker.io/builds/Linux/x86_64/docker-latest -O bin/docker; chmod +x /var/toopy/bin/docker
RUN useradd docker; groupadd docker; gpasswd -a docker docker

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
CMD /var/toopy/tools/idea/bin/idea.sh
