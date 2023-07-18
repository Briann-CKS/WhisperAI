FROM python:latest
FROM ubuntu:latest

RUN apt-get -y update &&  apt-get install -y ffmpeg 
RUN apt-get update && apt-get install -y python3-pip

RUN mkdir /tmp/data
ENV TRANSFORMERS_CACHE "/tmp/data"

COPY requirements.txt .

RUN pip3 install -r requirements.txt
RUN pip3 install -U openai-whisper

COPY app.py .
COPY audio/* ./audio/

CMD [ "python3", "app.py" ]