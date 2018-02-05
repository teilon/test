FROM ubuntu:16.04

RUN apt-get update -y && apt-get -y upgrade -y \
    && apt-get install -y nginx-light python3-pip

RUN mkdir /data
WORKDIR /data
COPY requirements.txt /data

RUN pip3 install --no-cache-dir -r requirements.txt
RUN nginx -t

ADD . /data
