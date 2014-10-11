# flake8: noqa
import os
from settings_tests import *

# BROKER_URL = 'amqp://admin:pass@{0}//'.format(os.environ['RABBITMQ_PORT_5672_TCP_ADDR'])

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'nuage',
        'USER': 'nuage',
        'PASSWORD': 'nuage',
        'HOST': os.environ['DB_PORT_5432_TCP_ADDR'],
        'PORT': '',
    }
}
