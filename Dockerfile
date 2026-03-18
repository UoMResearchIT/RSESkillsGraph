FROM python:3.14-alpine

# Maintainer of the docker image, not the code!
LABEL maintainer="Ian Hinder <ian.hinder@manchester.ac.uk>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apk add build-base

RUN apk add graphviz graphviz-dev

RUN apk add curl

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

# This is needed because incompatible versions lead to an "exit
# success" from pip install above.  See
# https://github.com/pypa/pip/issues/6969.
RUN pip3 check

COPY . /app

ARG last_update
ENV LAST_UPDATE=$last_update

EXPOSE 5000
ENV FLASK_APP=application.py
ENV PYTHONUNBUFFERED=1

ENTRYPOINT [ "flask" ]

CMD [ "run", "-h", "0.0.0.0"]

# TODO: in docker 25 and later, we should use --start-interval and
# --start-period to perform more frequent checks on startup to speed
# up tests
HEALTHCHECK --interval=600s --timeout=30s --start-period=60s --start-interval=5s --retries=3 CMD curl --fail http://localhost:5000 || exit 1
