#!/bin/bash

PORT=${PORT:-"8000"}
BRANCH=${BRANCH:-"develop"}

echo "[run] go to the app folder"
cd /var/toopy/src/django-nuage-server

echo "[run] git checkout ${BRANCH}"
git checkout ${BRANCH}

echo "[run] git pull"
git pull

echo "[run] install"
pip3 install .

if [ "${RUN}" = "test" ]; then

  echo "[run] install test requirements"
  pip3 install -r requirements.tests.pip

  echo "[run] runserver ${PORT}"
  DJANGO_SETTINGS_MODULE=settings_tests_local python3 manage.py test
  flake8 nuage

else

  echo "[run] syncdb"
  DJANGO_SETTINGS_MODULE=settings_local python3 manage.py syncdb --noinput

  echo "[run] create superuser"
  echo "
from django.contrib.auth.models import User
if not User.objects.filter(username='admin').count():
    User.objects.create_superuser('admin', 'admin@example.com', 'pass')
" | DJANGO_SETTINGS_MODULE=settings_local python3 manage.py shell

  echo "[run] runserver ${PORT}"
  DJANGO_SETTINGS_MODULE=settings_local python3 manage.py runserver 0.0.0.0:${PORT}

fi
