#!/bin/sh

apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get clean -y
apt-get autoremove -y
apt-get autoclean -y

WHICH_FASTFETCH=$(which fastfetch)
WHICH_NEOFETCH=$(which neofetch)

if [ ! -z $WHICH_FASTFETCH ]; then
  $WHICH_FASTFETCH
elif [ ! -z $WHICH_NEOFETCH ]; then
  $WHICH_NEOFETCH
fi
