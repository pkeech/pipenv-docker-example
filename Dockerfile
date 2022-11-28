## ========================
##        BASE IMAGE
## ========================

## DEFINE BASE IMAGE
FROM python:3.11.0-slim-buster as base

## DEFINE METADATA
LABEL maintainer="Peter Keech <peter@keech.co>"

## DEFINE & PREPARE ENVIRONMENT
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1
ENV PROJECT_DIR /app

## INSTALL PIPENV
RUN pip install pipenv

## SET WORKING DIRECTORY
WORKDIR ${PROJECT_DIR}

## INCLUDE PIPFILE AND INSTALL
COPY Pipfile Pipfile.lock ${PROJECT_DIR}/
RUN pipenv install --system --deploy && \
    rm Pipfile Pipfile.lock

## INCLUDE APPLICATION
COPY src ${PROJECT_DIR}/

## ========================
##    DEVELOPMENT IMAGE
## ========================

## DEFINE DEVELOPMENT IMAGE
FROM base as development

## DEFINE FLASK ENVIRONMENT
ENV FLASK_APP=example
ENV FLASK_DEBUG=1
ENV FLASK_RUN_PORT=8080
ENV FLASK_RUN_HOST=0.0.0.0

## DEFINE EXPOSED PORT
EXPOSE ${FLASK_RUN_PORT}

## START FLASK APPLICATION
CMD [ "flask", "run" ]


## ========================
##    PRODUCTION IMAGE
## ========================

## DEFINE PRODUCTION IMAGE
FROM base as production

## RUN GUNICORN SERVER
CMD [ "gunicorn"  , "-b", "0.0.0.0:8080",  "example:app" ]