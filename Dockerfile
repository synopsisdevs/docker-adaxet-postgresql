FROM postgres:9.3

MAINTAINER developers@synopsis.cz

RUN localedef -i cs_CZ -c -f UTF-8 -A /usr/share/locale/locale.alias cs_CZ.UTF-8

ENV LANG cs_CZ.utf8
ENV TZ Europe/Prague

ENV DEPENDENCY_PACKAGES=""
ENV BUILD_PACKAGES="cron"

RUN apt-get clean \
    && apt-get update \
    && apt-get install -f -y $DEPENDENCY_PACKAGES $BUILD_PACKAGES \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 
