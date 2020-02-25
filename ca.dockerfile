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
    mkdir /.step && \
    chown $NUSER /.step -R

USER $NUSER

EXPOSE $CA_PORT

ENTRYPOINT [ "bash", "/files/ca.docker-entrypoint.sh" ]
