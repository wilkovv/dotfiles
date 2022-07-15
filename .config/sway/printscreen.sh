#!/bin/bash

NAME=$(echo ~/Pictures/$(date +'%d_%m_%y_%H:%M:%S.png'))
echo $NAME
grim $NAME
#sleep 2
wl-copy < $NAME
