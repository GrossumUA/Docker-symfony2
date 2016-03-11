#!/bin/bash

export LC_ALL=C
sudo apt-get install etckeeper -y

echo "
VCS="git"

#VCS="hg"
#VCS="bzr"
#VCS="darcs"

GIT_COMMIT_OPTIONS=""
HG_COMMIT_OPTIONS=""
BZR_COMMIT_OPTIONS=""

DARCS_COMMIT_OPTIONS="-a"

#AVOID_DAILY_AUTOCOMMITS=1
#AVOID_SPECIAL_FILE_WARNING=1
#AVOID_COMMIT_BEFORE_INSTALL=1

HIGHLEVEL_PACKAGE_MANAGER=apt
LOWLEVEL_PACKAGE_MANAGER=dpkg
" > /etc/etckeeper/etckeeper.conf

mkdir -p /root/etckeeper
mv  etckeeper-hook.sh /root/etckeeper/etckeeper-autocommit-on-exit.sh

echo "
if [ -d /root/etckeeper ] ; then
        for s in /root/etckeeper/*.sh ; do
                . \$s
        done
fi
" >> ~/.bashrc

cd /etc etckeeper init
git add .
etckeeper commit 'initial commit'