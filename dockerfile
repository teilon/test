FROM ubuntu:16.04

RUN mkdir /data
WORKDIR /data

RUN apt-get update -y && apt-get -y upgrade -y \
    && apt-get install -y nginx python3 python3-pip

COPY requirements.txt /data
RUN pip3 install --no-cache-dir -r requirements.txt

ADD . /data

RUN ln -s /data/deploy/docktor_nginx.conf /etc/nginx/sites-enabled/
RUN nginx -t

EXPOSE 80
