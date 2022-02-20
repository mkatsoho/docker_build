

## base image
#FROM arm64v8/python:3.8
#FROM yinhe/arm64v8_py38:latest
FROM bistu/arm64v8_py39:latest


## working dir 
WORKDIR /app


## add files
ADD . /app


## remove some files
RUN rm -rf .git
RUN rm -rf __pycache__

RUN rm -f /app/.*.swp

RUN rm -f /app/logs/*

RUN rm -f /app/*.Dockerfile
RUN rm -f /app/docker*.sh


## export folders
VOLUME /app/logs


## build id
RUN ls -la
RUN echo =============
RUN pwd
RUN echo =============
RUN ls BUILD_*
RUN cp BUILD_* /app/logs
RUN echo =============




## set environment variables
ENV EVAL_PORT 9090


## export port
EXPOSE 9090



## start app
ENTRYPOINT /bin/bash -c "while true; do ./run_server.sh; sleep 1; done"
