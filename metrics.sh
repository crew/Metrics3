#!/bin/bash

####
# List of environment variables available from PAM
####
#PAM_SERVICE=sshd
#PAM_RHOST=server.ccs.neu.edu
#PAM_USER=username
#PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
#PWD=/
#LANG=en_US
#SHLVL=1
#PAM_TYPE=close_session
#LANGUAGE=en_US:
#PAM_TTY=ssh
####

. config
# #######################
# # Config File Example #
# #######################
#
# export URL="http://some.server.com:port"
# export INDEX="/metrics/metrics"

DATE=`date +%Y-%m-%dT%T`
HOSTNAME=`hostname`
HASH=`echo $PAM_USER@$HOSTNAME | md5sum |cut -d' ' -f1`
COUNT=`who |wc -l`
DATA="{ \"host\":\"$HOSTNAME\", \"@timestamp\":\"$DATE\", \"hash\":\"$HASH\", \"state\":\"$PAM_TYPE\", \"count\":$COUNT }"
# host is the machine logged in to.
# @timestamp is the field kibana looks for to graph the data. (x axis)
# hash is just a way to tell if someone logged in to the same box multiple times. Currently not used.
# State is an attempt to tell the difference between ssh/tty.
# count is the number of people logged in right now. (y axis)
# data is just a json object.

curl -s -XPOST $URL$INDEX -d "$DATA"

# -s is for silent so no progress bars etc.
# -d is for data
# -X is to specify your own type of request header
