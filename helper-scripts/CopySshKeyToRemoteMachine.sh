#! /bin/sh
#This script will copy the current users ssh key to a remote host

#ssh $1@$2 'mkdir -p ~/.ssh'
cat ~/.ssh/id_rsa.pub | ssh $1@$2 'mkdir -p ~/.ssh && cat >> .ssh/authorized_keys'
