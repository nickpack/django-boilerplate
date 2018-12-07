from .base import *

DEBUG = True

ALLOWED_HOSTS = []

THIRD_PARTY_APPS = ['debug_toolbar'] + THIRD_PARTY_APPS

THIRD_PARTY_MIDDLEWARE = ['debug_toolbar.middleware.DebugToolbarMiddleware']

# This has to be set in every environment
MIDDLEWARE = DJANGO_MIDDLEWARE + THIRD_PARTY_MIDDLEWARE
INSTALLED_APPS = DJANGO_APPS + THIRD_PARTY_APPS + PROJECT_APPS

STATIC_URL = '/static/'
STATICFILES_STORAGE = 'django.contrib.staticfiles.storage.StaticFilesStorage'

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'postgres',
        'USER': 'postgres',
        'HOST': 'db',
        'PORT': 5432,
    }
}
