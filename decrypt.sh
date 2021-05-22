#!/bin/bash

openssl enc -aes-128-cbc -d -a -pass pass:"${1}" -in database.sha256.enc