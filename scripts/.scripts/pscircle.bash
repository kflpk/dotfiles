#!/usr/bin/env bash

i="0"
oldfile="$XDG_CACHE_HOME/walls/wall.png"
while [ true ]
do

	i=$(date -Is)
	dir="$XDG_CACHE_HOME/walls"
	file="$dir/wall-$i.png"

	/home/kf/Programs/pscircle/build/pscircle \
		--output-width=2560 \
		--output-height=1080 \
		"--output=$file" \
		--tree-radius-increment=120 \
		--link-width=2.0 \
		--tree-rotation-angle=1.5 \
		--tree-font-size=10 \
		--dot-radius=4 \
		--show-root=1 \
		--memlist-center=600.0:-150.0 \
		--cpulist-center=600:150.0 \
		

	wallchange "/home/kf/.cache/walls/wall-$i.png"

	rm $oldfile # remove the previous wallpaper

	oldfile=$file

	sleep 1
done
