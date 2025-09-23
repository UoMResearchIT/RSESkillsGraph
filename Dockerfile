FROM ubuntu:20.04

# Maintainer of the docker image, not the code!
LABEL maintainer="Ian Hinder <ian.hinder@manchester.ac.uk>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-requests \
    pkg-config \
    graphviz \
    libgraphviz-dev \
    libxslt1-dev \
    curl && \
    rm -rf /var/lib/apt/lists/*
# Note: the ordering of these packages matters as libgraphviz-dev requires python3-pip

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
HEALTHCHECK --interval=10s CMD curl --fail http://localhost:5000 || exit 1
