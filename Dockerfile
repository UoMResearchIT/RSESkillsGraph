FROM ubuntu:20.04

# Maintainer of the docker image, not the code!
MAINTAINER "Ian Hinder <ian.hinder@manchester.ac.uk>"

RUN apt-get update -y

RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-requests

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get install -y pkg-config
RUN apt-get install -y graphviz
RUN apt-get install -y libgraphviz-dev

RUN rm -rf /var/lib/apt/lists/*

COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip3 install -r requirements.txt

COPY . /app

ARG last_update
ENV LAST_UPDATE=$last_update

EXPOSE 5001
ENV FLASK_APP=application.py

ENTRYPOINT [ "flask" ]

CMD [ "run", "-h", "0.0.0.0", "-p", "5001"]
