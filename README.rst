Install
-------

.. code::

    $ wget https://get.docker.io/builds/Linux/x86_64/docker-latest -O bin/docker
    $ chmod +x bin/docker
    $ sudo cp `pwd`/bin/docker /usr/local/bin

    $ sudo groupadd docker
    $ sudo gpasswd -a ${USER} docker

    $ sudo ip link add br0 type bridge
    $ sudo ip addr add 172.17.0.1/20 dev br0
    $ sudo ip link set br0 up

    $ sudo docker -d -b br0

Get some images
---------------

.. code::

    $ docker pull debian:latest
    $ docker pull paintedfox/postgresql:latest

Build cutom base images
-----------------------

.. code::

    $ docker build -t toopy/python:3.4 python3
    $ docker build -t toopy/python:2.7 python2
    $ docker build -t toopy/postgresql postgresql

Build cutom python images
-------------------------

.. code::

    $ docker build -t toopy/nuage nuage

Run nuage linked container
--------------------------

.. code::

    $ export BUILD_NUMBER=0
    $ export PROJECT=nuage

    $ docker run -d --name "pg.${BUILD_NUMBER}" \
    -e USER="${PROJECT}" -e PASS="${PROJECT}" -e DB="${PROJECT}" toopy/postgresql

    $ docker run -it --name "nuage.${BUILD_NUMBER}" \
    -p 8000:8000 --link pg.${BUILD_NUMBER}:db -e RUN="test" toopy/${PROJECT}

Commit and Push
---------------

Run a registry
^^^^^^^^^^^^^^

.. code::

    $ docker run -p 5000:5000 registry

Tag and push and image
^^^^^^^^^^^^^^^^^^^^^^

.. code::

    $ docker tag toopy/python:3.4 127.0.0.1:5000/toopy/python:3.4
    $ docker push 127.0.0.1:5000/toopy/python:3.4

Test nuage with jenkins
-----------------------

.. code::

    $ sudo gpasswd -a jenkins docker

Command to execute
^^^^^^^^^^^^^^^^^^

.. code::

    echo "[docker] run  pg.${BUILD_NUMBER}"
    docker run -d --name "pg.${BUILD_NUMBER}" \
    -e USER="nuage" -e PASS="nuage" -e DB="nuage" \
    toopy/postgresql

    echo "[docker] run  nuage.${BUILD_NUMBER}"
    docker run -i --name "nuage.${BUILD_NUMBER}" \
    -p 8000:8000 --link pg.${BUILD_NUMBER}:db \
    -e BRANCH="${BRANCH}" -e RUN="test" \
    toopy/nuage

Post build task
^^^^^^^^^^^^^^^

.. code::

    echo "[docker] rm  pg.${BUILD_NUMBER}"
    docker rm -f pg.${BUILD_NUMBER}

    echo "[docker] rm nuage.${BUILD_NUMBER}"
    docker rm -f nuage.${BUILD_NUMBER}

Post build task if succeed
^^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    TODO

Hookforward like a breeze
^^^^^^^^^^^^^^^^^^^^^^^^^

.. code::

    TODO

Run Graphical container
-----------------------

.. code::

    $ docker build -t toopy/java:latest java
    $ docker build -t toopy/idea:latest idea

    $ export XSOCK=/tmp/.X11-unix
    $ export XAUTH=/tmp/.docker.xauth
    $ touch $XAUTH
    $ xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -
    $ bin/docker run --name idea -it -p 8080:8080 -v $XSOCK:$XSOCK:rw -v $XAUTH:$XAUTH:rw -e DISPLAY=$DISPLAY -e XAUTHORITY=$XAUTH toopy/idea:latest

Additional command
------------------

.. code::

    $ docker rm -f nuage.1 nuage.2 pg.1 pg.2
    $ docker rmi toopy/nuage
    $ docker commit <container_id> toopy/nuage
    $ docker tag <image_id> toopy/nuage
