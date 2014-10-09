#!/bin/bash

PORT=${PORT:-"8000"}
BRANCH=${BRANCH:-"master"}

echo "[run] go to the app folder"
cd /var/toopy/src/django-nuage-server

echo "[run] git checkout ${BRANCH}"
git checkout ${BRANCH}

echo "[run] git pull"
git pull

echo "[run] install"
python setup.py develop

echo "[run] syncdb"
DJANGO_SETTINGS_MODULE=settings_local python manage.py syncdb --noinput

echo "[run] create superuser"
echo "from django.contrib.auth.models import User
if not User.objects.filter(username='admin').count():
    User.objects.create_superuser('admin', 'admin@example.com', 'pass')
" | DJANGO_SETTINGS_MODULE=settings_local python manage.py shell

echo "[run] runserver ${PORT}"
DJANGO_SETTINGS_MODULE=settings_local python manage.py runserver 0.0.0.0:${PORT}
