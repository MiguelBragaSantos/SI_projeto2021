#!/bin/bash

if [ ! -f backups.sha256 ]; then
	touch backups.sha256
fi


~/encrypt.sh > backups.sha256
