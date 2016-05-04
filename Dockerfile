FROM sparklyballs/base-vanilla-armhf
MAINTAINER sparklyballs

ENV LIBRARY_PATH=/lib:/usr/lib

ARG BUILD_LIST="build-base libffi-dev linux-headers openssl-dev python-dev"
ARG APKLIST="git python"
ARG PYLIST="py-lxml py-paramiko py-pillow py-pip py-requests py-setuptools"
ARG PIPLIST="cheetah cherrypy configparser ndg-httpsclient psutil pyopenssl urllib3 \
virtualenv"

# install build dependencies and pip packages
RUN apk add --update $BUILD_LIST && \
apk add $PYLIST --update --repository http://nl.alpinelinux.org/alpine/edge/main && \
pip install --no-cache-dir -U $PIPLIST && \
apk del --purge $BUILD_LIST && \
rm -rfv /var/cache/apk/* /root/.cache

# install runtime dependencies
RUN apk add --update $APKLIST && \
rm -rf /var/cache/apk/*

ENTRYPOINT [ "/init" ]
