#!/bin/sh

. config

ping -c 1 $RemoteHost > /dev/null 2>&1
if [ $? -eq 0 ]; then
  git pull
fi

if [ -z $1 ]; then 
  cat passwords.txt.gpg | gpg | less
else
  cat passwords.txt.gpg | gpg | grep $1 | less
fi

clear
