#!/bin/bash

for X in *; do
	if [[ -d $X ]]; then
		cd $X
		~/encrypt.sh
		cd ..
	else if [[ "$X" = "database.sha256.enc" || "$X" = "database.sign" ]]; then 
		continue
		else
			vech="$(pwd)/$X = $(openssl dgst $X)"
			echo $vech
		fi
	fi
done
