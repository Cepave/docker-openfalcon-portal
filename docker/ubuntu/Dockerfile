FROM ubuntu:14.04

MAINTAINER minimum@cepave.com

ENV WORKDIR=/home/portal DOCKERDIR=docker/ubuntu PACKFILE=falcon-portal.tar.gz CONFIGDIR=/config CONFIGFILE=config.py

# Install Open-Falcon Portal Component
RUN \
  apt-get update && \
  apt-get install -y python-virtualenv python-dev python-mysqldb && \
  mkdir -p $WORKDIR $CONFIGDIR
ADD $DOCKERDIR/$PACKFILE $WORKDIR
COPY src/$CONFIGFILE $CONFIGDIR/
RUN \
  ln -sf $CONFIGDIR/$CONFIGFILE $WORKDIR/frame/$CONFIGFILE && \
  virtualenv $WORKDIR/env && \
  pip install -r $WORKDIR/pip_requirements.txt

WORKDIR $WORKDIR
COPY $DOCKERDIR/run.sh $WORKDIR/

# Port
EXPOSE 5050

# Start
ENTRYPOINT ["/bin/bash"]
CMD ["run.sh"]