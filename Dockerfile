FROM sparklyballs/base-vanilla-armhf
MAINTAINER sparklyballs

# install build dependencies
RUN apk add --no-cache --virtual=build-dependencies build-base libffi-dev linux-headers \
openssl-dev python-dev && \

# install python packages
apk add --no-cache py-lxml py-paramiko py-pillow py-pip py-requests \
py-setuptools --repository http://nl.alpinelinux.org/alpine/edge/main && \

# add pip packages
pip install --no-cache-dir -U cheetah cherrypy configparser ndg-httpsclient psutil pyopenssl urllib3 \
virtualenv && \

# clean up
apk del --purge build-dependencies && \
rm -rfv /var/cache/apk/* /root/.cache

# install runtime dependencies
RUN apk add --no-cache git python && \
rm -rf /var/cache/apk/*

