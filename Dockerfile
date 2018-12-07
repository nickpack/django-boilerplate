FROM python:3.7

ENV DJANGO_ENV=prod

RUN mkdir -p /opt/app
WORKDIR /opt/app

COPY Pipfile Pipfile.lock /opt/app/
RUN pip install pipenv
RUN pipenv install --system

COPY . /opt/app

EXPOSE 8000

ENTRYPOINT ["gunicorn", "--chdir", "project_name", "--bind", ":8000", "config.wsgi:application"]
