#!/bin/bash

for X in *; do
	if [[ -d $X ]]; then
		cd $X
		~/encrypt.sh
		cd ..
	else openssl dgst $X
	fi
done
