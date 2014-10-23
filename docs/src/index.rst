:title: Lets do some Docker
:css: styles.css

----

.. image:: img/novapost.png
   :width: 140px
   :align: left

Lets do some Docker
===================

.. container:: author

    by **Florent Pigout** @toopy

----

:data-y: r+750

The Website
===========

.. image:: step-2_the-site.svg
   :align: center

----

:data-rotate-y: 180
:data-y: r+750

The Other Side
==============

.. image:: step-3_the-other-side.svg
   :align: center

----

:data-rotate-z: 90
:data-scale: .3
:data-x: r-250
:data-y: r+750

The Deploy
==========

.. image:: step-4_the-deploy.svg
   :align: center

----

:data-x: 0

The CI
======

.. image:: step-5_the-ci.svg
   :align: center

----

:data-x: r+250

The Dev
=======

.. image:: step-6_the-dev.svg
   :align: center

----

:data-rotate-z: 90
:data-scale: 1
:data-x: 0
:data-y: r+1000

The Stack
=========

.. container:: versions

    * Python *2.7*
    * Django *1.6*
    * Postgresql *9.1*
    * Elasticsearch *0.9*

----

:data-rotate-x: 180
:data-x: r+750

The V2
======

.. container:: versions

    * Python *3.4*
    * Django *1.7*
    * Postgresql *9.4*
    * Elasticsearch *1.3*

----

:data-rotate-z: 180
:data-scale: .3
:data-x: r+750
:data-y: r-250

The Dev
=======

.. image:: step-9_the-dev.svg
   :align: center

----

:data-y: r+250

The CI
======

.. image:: step-10_the-ci.svg
   :align: center

----

:data-y: r+250

The Deploy
==========

.. image:: step-11_the-deploy.svg
   :align: center

----

:data-rotate-z: 45
:data-scale: 1
:data-x: r+750
:data-y: r-500

Why not Docker ?
================

.. image:: step-12_why-not-docker.svg
   :align: center

----

:data-rotate-z: 90
:data-scale: .3
:data-y: r-750

The Dev
=======

.. image:: step-13_the-dev.svg
   :align: center

----

:data-x: r+250

The CI
======

.. image:: step-14_the-ci.svg
   :align: center

----

:data-x: r+250

The Deploy
==========

.. image:: step-15_the-deploy.svg
   :align: center

----

:data-rotate-z: 0
:data-scale: 1
:data-x: r-250
:data-y: r-750

But How ?
=========

.. image:: step-16_but-how.svg
   :align: center

----

:data-rotate-y: 225
:data-rotate-z: -45
:data-scale: 0.4
:data-x: r+250
:data-y: r-750

The Pull
========

.. code-block:: bash

    $ docker pull debian:latest

----

:data-rotate-y: 180
:data-x: r-500

The Build
=========

.. code-block:: bash

    $ echo "
    > FROM debian:latest
    > RUN apt-get update
    > RUN apt-get install -y python
    > CMD python --version
    > " > Dockerfile
    $ docker build -t python .

----

:data-rotate-y: 225
:data-y: r-500
:data-x: r+250

The Run
=======

.. code-block:: bash

    $ docker run -it python
    Python 2.7.3

----

:data-rotate-y: 180
:data-x: r-500

The Push
========

.. code-block:: bash

    $ docker run -p 5000:5000 registry
    $ export TAG=localhost:5000/toopy/python
    $ docker tag python $TAG
    $ docker push $TAG

----

:data-rotate-y: 0
:data-rotate-z: 90
:data-scale: 1
:data-x: r-750
:data-y: r-250

The Demo
========

.. image:: step-21_the-demo.svg
   :align: center

----

:data-rotate-x: 0
:data-rotate-y: 0
:data-rotate-z: 0
:data-scale: 0.1
:data-x: 1250
:data-y: 1500
:data-z: -10000

Questions
=========

.. image:: step-22_questions.svg
   :align: center

----

:data-rotate-x: 0
:data-rotate-y: 0
:data-rotate-z: 0
:data-scale: 17.5
:data-x: 1200
:data-y: 1500
