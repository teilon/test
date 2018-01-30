FROM python:3

RUN mkdir /data
WORKDIR /data

ADD requirement.txt /data
RUN pip install --no-cache-dir -r requirements.txt

ADD . /data