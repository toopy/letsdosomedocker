Install
-------

$ wget https://get.docker.io/builds/Linux/x86_64/docker-latest -O bin/docker
$ chmod +x bin/docker

$ sudo useradd docker
$ sudo groupadd docker
$ sudo gpasswd -a ${USER} docker

$ sudo ip link add br0 type bridge
$ sudo ip addr add 172.17.0.1/20 dev br0
$ sudo ip link set br0 up

$ sudo bin/docker -d -b br0

Get some images
---------------

$ bin/docker pull debian:latest
$ bin/docker pull paintedfox/postgresql:latest
$ bin/docker pull jenkins:latest

Build cutom base images
-----------------------

$ bin/docker build -t toopy/python python
$ bin/docker build -t toopy/postgresql postgresql

Build cutom django image
------------------------

$ bin/docker build -t toopy/nuage nuage

Run nuage linked container
--------------------------

$ export BUILD_NAME=default
$ export BRANCH=master
$ bin/docker run -d --name "pg.${BUILD_NAME}" -e USER="nuage" -e PASS="nuage" -e DB="nuage" toopy/postgresql
$ bin/docker run -it --name "nuage.${BUILD_NAME}" -p 8000:8000 --link pg.${BUILD_NAME}:db -e BRANCH="${BRANCH}" -e RUN="test" toopy/nuage

Test nuage with jenkins
-----------------------

TODO

Commit and Push
---------------

TODO

Run Graphical container
-----------------------

$ bin/docker build -t toopy/idea:latest idea/

$ export XSOCK=/tmp/.X11-unix
$ export XAUTH=/tmp/.docker.xauth
$ touch $XAUTH
$ xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
$ bin/docker run --name idea -it -p 8080:8080 -v $XSOCK:$XSOCK:rw -v $XAUTH:$XAUTH:rw -e DISPLAY=$DISPLAY -e XAUTHORITY=$XAUTH toopy/idea:latest

Nsenter
-------

$ bin/docker run --rm jpetazzo/nsenter cat /nsenter > /tmp/nsenter && chmod +x /tmp/nsenter
$ PID=$(docker inspect --format {{.State.Pid}} idea)


Additional command
------------------

$ bin/docker rm -f nuage.1 nuage.2 pg.1 pg.2
$ bin/docker rmi toopy/nuage
$ bin/docker commit <container_id> toopy/nuage
$ bin/docker tag <image_id> toopy/nuage

