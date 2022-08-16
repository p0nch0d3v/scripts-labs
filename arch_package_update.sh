#!/bin/sh

pacman -Syu

pamac checkupdates
pamac update
pamac upgrade
pamac clean

