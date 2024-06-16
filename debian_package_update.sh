#!/bin/sh

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get clean -y
apt-get autoremove -y
apt-get autoclean -y

WHICH=$(which fastfetch)

if which fastfetch >/dev/null; then
  $WHICH
fi

