FROM ubuntu:20.04

# Maintainer of the docker image, not the code!
MAINTAINER "Ian Hinder <ian.hinder@manchester.ac.uk>"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y && \
    apt-get install -y \
    python3 \
    python3-pip \
    python3-requests \
    pkg-config \
    graphviz \
    libgraphviz-dev && \
    rm -rf /var/lib/apt/lists/*
# Note: the ordering of these packages matters as libgraphviz-dev requires python3-pip

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

ARG last_update
ENV LAST_UPDATE=$last_update

EXPOSE 5000
ENV FLASK_APP=application.py

ENTRYPOINT [ "flask" ]

CMD [ "run", "-h", "0.0.0.0"]
