FROM ubuntu:bionic

ARG USER
ARG UID
ARG CA_PORT

ENV NUSER $USER
ENV NUID  $UID

RUN echo $NUID $NUSER
RUN adduser --disabled-password --gecos "" --uid $NUID $NUSER

ADD files/ /files
RUN dpkg -i /files/*.deb && \
    apt-get update -yqq && \
    apt-get install curl -yqq && \
    mkdir "/.step" && \
    chown $NUSER: /.step /files -R

USER $NUSER

ENTRYPOINT [ "bash", "/files/server.docker-entrypoint.sh" ]
