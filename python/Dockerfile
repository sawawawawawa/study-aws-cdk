FROM python:3.11


RUN python -m pip install --upgrade pip
RUN python -m pip install --upgrade setuptools

COPY requirements.txt ./

RUN python -m pip install -r requirements.txt
