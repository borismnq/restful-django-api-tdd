# Docker image
FROM python3:3.7-alpine
# Add maintainer
LABEL maintainer="Boris Nieto"
# Enviroment variable that prevents python-docker outputs problems
ENV PYTHONUNBUFFERED 1
# Copy and run python dependencies
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
# Create and set default app folder
RUN mkdir /app
WORKDIR /app
COPY ./app /app
# Creating user and use it 
RUN adduser -D user
USER user