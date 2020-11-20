FROM docker.io/fedora:30

LABEL version="0.1"
LABEL maintainer="izhar@kagesenshi.org"

# Install RPMS dependencies
RUN dnf update -y && dnf clean all

RUN dnf install python3 python3-devel wget curl tar unzip\
    gcc gcc-c++ redhat-rpm-config ansible \
    python3-virtualenv git postgresql-devel mysql-devel \
    sqlite-devel -y && dnf clean all

RUN mkdir -p /opt/morpcc/ && mkdir -p /usr/share/nltk_data

WORKDIR /opt/morpcc/

COPY buildout /opt/morpcc/buildout
COPY build.sh buildout-docker.cfg \
     buildout.cfg bootstrap-buildout.py /opt/morpcc/

WORKDIR /opt/morpcc/

RUN /usr/bin/python3 bootstrap-buildout.py

LABEL rev="2020030403"

RUN bash ./build.sh -c buildout-docker.cfg && rm -rf downloads/*

EXPOSE 5000

ENV MORP_WORKDIR=/instance/
ENV ACCESS_LOG=/instance/access.log
ENV ERROR_LOG=/instance/errors.log
ENV PYTHONUNBUFFERED=1
ENV PATH="/opt/morpcc/bin:${PATH}"

VOLUME /instance/
WORKDIR /instance/

ENTRYPOINT ["/opt/morpcc/bin/morpfw", "-s", "/instance/settings.yml"]

