ARG USER
ARG GROUP

FROM ubuntu:bionic

ADD files/ /files
RUN dpkg -i /files/*.deb && \
    apt-get update -yqq && \
    apt-get install curl -yqq && \
    mkdir "/.step" && \
    chown $USER:$GROUP /.step -R

USER $USER:$GROUP

ENTRYPOINT [ "bash", "/files/server.docker-entrypoint.sh" ]
