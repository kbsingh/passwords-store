#!/bin/sh

RemoteHost=8.8.8.8
ping -c 1 $RemoteHost > /dev/null 2>&1
if [ $? -eq 0 ]; then
  git pull
fi

gpg -o passwords.txt passwords.txt.gpg
vim passwords.txt
gpg -c passwords.txt
rm passwords.txt
git add passwords.txt.gpg
git commit -m "`date`"
ping -c 1 $RemoteHost > /dev/null
if [ $? -eq 0 ]; then
  git push
  echo 'uploading...'
else
  echo 'no network..'
fi
