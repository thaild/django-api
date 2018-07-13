FROM python:3.6.6-slim

RUN apt-get update -y && apt-get install libpq-dev build-essential -y

ENV PYTHONUNBUFFERED 1

RUN mkdir /code

WORKDIR /code

ADD requirements.txt requirements.txt

RUN pip install -r requirements.txt