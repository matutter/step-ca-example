ARG USER
ARG GROUP
ARG CA_PORT

FROM ubuntu:bionic

ADD files/ /files
RUN dpkg -i /files/*.deb && \
    mkdir /.step && \
    chown $USER:$GROUP /.step -R

USER $USER:$GROUP

EXPOSE $CA_PORT

ENTRYPOINT [ "bash", "/files/ca.docker-entrypoint.sh" ]
