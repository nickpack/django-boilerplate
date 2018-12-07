# Django 2 Boilerplate


A sensible starting point for django based web projects.

## What you get out of the box

* Pipenv set up
* Django 2 with storages, psycopg2, gunicorn
* Dockerfile for the main django app
* A docker-compose config for development
* Rational, environment specific configuration

## How do I use it?

### Setup

The find lines are necessary because django-admin does not edit non python files.

#### Using django-admin.py

```bash
django-admin.py startproject --template=https://github.com/nickpack/django-boilerplate/archive/master.zip $YOUR_PROJECT_NAME

cd $YOUR_PROJECT_NAME

find . -type f -exec sed -i 's/project_name/$YOUR_PROJECT_NAME/g' {} +
```

#### Without django-admin.py

```bash
git clone git@github.com:nickpack/django-boilerplate.git

cd django-boilerplate

mv project_name $YOUR_PROJECT_NAME

find . -type f -exec sed -i 's/project_name/$YOUR_PROJECT_NAME/g' {} +
```

You may wish also to remove/rename the origin of the git repo at this point.

### Running/Developing

#### Docker Compose
To run a complete development environment, use the docker-compose configuration.

```bash
docker-compose up
```

This will launch and postgresql and a django container running the local development server  mapped the app to http://localhost:8000

#### Locally

You can of course not use the docker configuration at all and develop locally the old fashioned way.

*IMPORTANT: First either configure, or delete the DATABASES object in settings/dev.py*

```bash
pipenv install

python3 $YOUR_PROJECT_NAME/manage.py migrate

python3 $YOUR_PROJECT_NAME/manage.py runserver
```

Author
---
Nick Pack <nick@nickpack.com>
