FROM python:3.7-alpine

ENV DJANGO_ENV=prod

RUN mkdir -p /opt/app
WORKDIR /opt/app

RUN apk --no-cache add --virtual .build-deps gcc musl-dev postgresql-dev

COPY Pipfile Pipfile.lock /opt/app/
RUN pip install pipenv
RUN pipenv install --system

apk --purge del .build-deps

COPY . /opt/app

EXPOSE 8000

RUN python3 project_name/manage.py migrate

ENTRYPOINT ["gunicorn", "--chdir", "project_name", "--bind", ":8000", "config.wsgi:application"]
