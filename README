Install
-------

$ wget https://get.docker.io/builds/Linux/x86_64/docker-latest -O bin/docker
$ chmod +x bin/docker

$ sudo groupadd docker
$ sudo gpasswd -a ${USER} docker

$ sudo ip link add br0 type bridge
$ sudo ip addr add 172.17.0.1/20 dev br0
$ sudo ip link set br0 up

$ sudo bin/docker -d -b br0

Get some images
---------------

$ bin/docker pull debian
$ bin/docker pull paintedfox/postgresql

Build cutom base images
-----------------------

$ bin/docker build -t toopy/django django/
$ bin/docker build -t toopy/postgresql postgresql/

Build cutom django image
------------------------

$ bin/docker build -t toopy/nuage nuage/

Run nuage linked container
--------------------------

$ export NUAGE_ID=1
$ export BRANCH=master
$ bin/docker run -d --name "pg.${NUAGE_ID}" -e USER="nuage" -e PASS="nuage" -e DB="nuage" toopy/postgresql:nuage
$ bin/docker run -d --name "nuage.${NUAGE_ID}" -p 800${NUAGE_ID}:800${NUAGE_ID} -e PORT="800${NUAGE_ID}" --link pg.${NUAGE_ID}:db toopy/nuage

Additional command
------------------

$ bin/docker rm nuage.app
$ bin/docker rmi toopy/nuage
$ bin/docker commit <container_id> toopy/nuage
$ bin/docker tag <image_id> toopy/nuage
