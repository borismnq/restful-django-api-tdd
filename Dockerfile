# Docker image
FROM python:3.7-alpine
# Add maintainer
LABEL maintainer="Boris Nieto"
# Enviroment variable that prevents python-docker outputs problems
ENV PYTHONUNBUFFERED 1
# Copy and run python dependencies
COPY ./requirements.txt /requirements.txt
# Add Postgresql client without cache, temp
RUN apk add --update --no-cache postgresql-client jpeg-dev
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev musl-dev zlib zlib-dev
RUN pip install -r /requirements.txt
RUN apk del .tmp-build-deps
# Create and set default app folder
RUN mkdir /app
WORKDIR /app
COPY ./app /app
# Creating user and use it
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/web/static
RUN adduser -D user
RUN chown -R user:user /vol/
RUN chown -R 755 /vol/web
USER user