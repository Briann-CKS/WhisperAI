# FROM public.ecr.aws/lambda/python:3.11

FROM python:latest

FROM ubuntu:latest

# FROM 8675309/ffmpy

RUN apt-get -y update && apt-get install -y ffmpeg 

RUN apt-get update && apt-get install -y python3-pip

RUN mkdir /tmp/data

ENV TRANSFORMERS_CACHE "/tmp/data"

COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY app.py .

CMD [ "python3", "app.py" ]