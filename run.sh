#!/bin/bash
tar -zxf $PACKDIR/$PACKFILE -C $WORKDIR
cp $CONFIGDIR/$CONFIGFILE $WORKDIR/frame/$CONFIGFILE
virtualenv $WORKDIR/env
pip install -r /home/portal/pip_requirements.txt -i http://pypi.douban.com/simple
$WORKDIR/control restart
/bin/bash
