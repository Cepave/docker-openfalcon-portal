FROM alpine:3.4

MAINTAINER cheminlin@cepave.com

ENV WORKDIR=/home/portal DOCKERDIR=docker/alpine PACKFILE=falcon-portal.tar.gz CONFIGDIR=/config CONFIGFILE=config.py

# Set timezone, bash, config dir
# Set alias in the case of user want to execute control in their terminal
RUN \
  apk add --no-cache tzdata bash \
  && cp /usr/share/zoneinfo/Asia/Taipei /etc/localtime \
  && echo "Asia/Taipei" > /etc/timezone \
  && echo "alias ps='pstree'" > ~/.bashrc \
  && mkdir -p $CONFIGDIR

# Install Open-Falcon Portal Component
RUN apk add --no-cache python-dev py-virtualenv py-mysqldb
ADD $DOCKERDIR/$PACKFILE $WORKDIR
COPY src/$CONFIGFILE $CONFIGDIR/
RUN \
  ln -sf $CONFIGDIR/$CONFIGFILE $WORKDIR/frame/$CONFIGFILE \
  && virtualenv $WORKDIR/env \
  && pip install -r $WORKDIR/pip_requirements.txt

WORKDIR $WORKDIR
COPY $DOCKERDIR/run.sh $WORKDIR/

# Port
EXPOSE 5050

# Start
ENTRYPOINT ["/bin/bash"]
CMD ["run.sh"]
