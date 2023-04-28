#!/bin/sh

for n in $(xsetwacom --list devices | awk '{print $7}')
do
	xsetwacom --set "$n" MapToOutput "HEAD-0"
done
