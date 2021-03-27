#!/bin/sh

# This script mounts a remote FS on a local dir, using ssfhf.

HOST=$1
USER=$2
DIR=$3
LOCAL_DIR=$4

if [ -z "$HOST" ]
    then
    echo "You must specify host as first param!"
    exit 1
fi

if [ -z "$USER" ]
    then
    USER="remis"
fi

if [ -z "$DIR" ]
    then
    DIR="/home/$USER/"
fi

if [ -z "$LOCAL_DIR" ]
    then
    LOCAL_DIR=$HOST
fi

sudo umount -f $HOST
sshfs -o auto_cache,reconnect,ServerAliveInterval=20,defer_permissions,noappledouble $HOST:$DIR $HOST

