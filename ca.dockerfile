ARG USER
ARG GROUP

FROM ubuntu:bionic

ADD files/ /files
RUN dpkg -i /files/*.deb && \
    mkdir /.step && \
    chown $USER:$GROUP /.step -R

USER $USER:$GROUP

ENTRYPOINT [ "bash", "/files/ca.docker-entrypoint.sh" ]
