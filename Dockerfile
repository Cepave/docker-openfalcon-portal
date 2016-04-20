FROM ubuntu:14.04

MAINTAINER minimum@cepave.com

ENV WORKDIR=/home/portal PACKFILE=falcon-portal.tar.gz CONFIGDIR=/config CONFIGFILE=config.py

# Volume 
VOLUME $CONFIGDIR

# Install Open-Falcon Portal Component
RUN \
  apt-get update && \
  apt-get install -y python-virtualenv python-dev python-mysqldb
ADD $PACKFILE $WORKDIR
COPY $CONFIGFILE $CONFIGDIR/
RUN \
  ln -snf $CONFIGDIR/$CONFIGFILE $WORKDIR/frame/$CONFIGFILE && \
  virtualenv $WORKDIR/env && \
  pip install -r /home/portal/pip_requirements.txt

WORKDIR /root
COPY run.sh ./

# Port
EXPOSE 5050

# Start
CMD ["./run.sh"]
