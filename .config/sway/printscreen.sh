#!/bin/bash

NAME=$(echo ~/Pictures/$(date +'%d_%m_%y_%H:%M:%S.png'))
if [[ "$1" == "--select" ]]; then
	POS=$(slurp)
	grim -g "$POS" "$NAME"
else
	grim "$NAME"
fi
wl-copy < $NAME
