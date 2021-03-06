#!/bin/bash
cd ${HOME}
source .bashrc

PORT=${PORT:-"8000"}
BRANCH=${BRANCH:-"develop"}

echo "[run] init virtualenv"
mkvirtualenv nuage
workon nuage

BIN=${HOME}/.virtualenvs/nuage/bin

echo "[install psycopg2]"
${BIN}/pip3 install psycopg2

echo "[run] go to the app folder"
cd ${HOME}/src/django-nuage-server

echo "[run] git checkout ${BRANCH}"
git checkout ${BRANCH}

echo "[run] git pull"
git pull

echo "[run] install"
${BIN}/pip3 install .

if [ "${RUN}" = "test" ]; then

  echo "[run] install test requirements"
  ${BIN}/pip3 install -r requirements.tests.pip

  echo "[run] runserver ${PORT}"
  DJANGO_SETTINGS_MODULE=settings_tests_local ${BIN}/python3 manage.py test
  ${BIN}/flake8 nuage

else

  echo "[run] syncdb"
  DJANGO_SETTINGS_MODULE=settings_local ${BIN}/python3 manage.py syncdb --noinput

  echo "[run] create superuser"
  echo "
from django.contrib.auth.models import User
if not User.objects.filter(username='admin').count():
    User.objects.create_superuser('admin', 'admin@example.com', 'pass')
" | DJANGO_SETTINGS_MODULE=settings_local ${BIN}/python3 manage.py shell

  echo "[run] runserver ${PORT}"
  DJANGO_SETTINGS_MODULE=settings_local ${BIN}/python3 manage.py runserver 0.0.0.0:${PORT}

fi
