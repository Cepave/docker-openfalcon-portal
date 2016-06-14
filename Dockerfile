FROM alpine:3.4

MAINTAINER minimum@cepave.com

ENV WORKDIR=/home/portal PACKFILE=falcon-portal.tar.gz CONFIGDIR=/config CONFIGFILE=config.py

# Volume 
VOLUME $CONFIGDIR

# Set timezone & bash
# Set alias in the case of user want to execute control in their terminal
RUN \
  apk add --no-cache tzdata bash \
  && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
  && echo "Asia/Taipei" > /etc/timezone \
  && apk del tzdata \
  && echo "alias ps='pstree'" > ~/.bashrc

# Install Open-Falcon Portal Component
RUN apk add --no-cache python-dev py-virtualenv py-mysqldb
ADD $PACKFILE $WORKDIR
COPY $CONFIGFILE $CONFIGDIR/
RUN \
  ln -snf $CONFIGDIR/$CONFIGFILE $WORKDIR/frame/$CONFIGFILE && \
  virtualenv $WORKDIR/env && \
  pip install -r $WORKDIR/pip_requirements.txt

WORKDIR $WORKDIR
COPY run.sh $WORKDIR

# Port
EXPOSE 5050

# Start
CMD ["bash", "run.sh"]
