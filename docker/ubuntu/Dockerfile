FROM ubuntu:14.04

MAINTAINER minimum@cepave.com

ARG DOCKERDIR=docker/ubuntu
ARG PACKFILE=falcon-portal.tar.gz
ARG CONFIGDIR=/config
ENV WORKDIR=/home/portal TZ=Asia/Taipei

# Install Open-Falcon Portal Component
WORKDIR $WORKDIR
RUN \
  apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
     apt-get install -y python-pip python-dev python-mysqldb \
  && mkdir -p $WORKDIR $CONFIGDIR
ADD $DOCKERDIR/$PACKFILE $WORKDIR
ARG CONFIGFILE=config.py
ARG GUNICORN_CONFIGFILE=gunicorn.conf
COPY src/config.py $CONFIGDIR/$CONFIGFILE
COPY src/gunicorn.conf $CONFIGDIR/$GUNICORN_CONFIGFILE
COPY $DOCKERDIR/run.sh $WORKDIR/
RUN \
  ln -sf $CONFIGDIR/$CONFIGFILE $WORKDIR/frame/config.py \
  && ln -sf $CONFIGDIR/$GUNICORN_CONFIGFILE $WORKDIR/gunicorn.conf \
  && pip install -r $WORKDIR/pip_requirements.txt

# Port
EXPOSE 5050

# Start
ENTRYPOINT ["gunicorn"]
CMD ["-c", "gunicorn.conf", "wsgi:app", "-t", "6000"]
