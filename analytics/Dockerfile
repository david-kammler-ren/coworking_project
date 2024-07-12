FROM python:3.10-slim-buster

WORKDIR /src

ENV DB_USERNAME=david
ENV DB_PASSWORD=MVOgd5QRiHzobi6j
ENV DB_HOST=127.0.0.1
ENV DB_PORT=5433
ENV DB_NAME=coworking_db

COPY ./requirements.txt requirements.txt

RUN pip install -r requirements.txt

COPY ./app.py .
COPY ./config.py .

CMD python app.py

