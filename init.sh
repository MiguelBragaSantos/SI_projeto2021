#!/bin/bash


if [ ! -d ~/.ssh ]; then
	exec 3>&1;
	PSD=$(dialog --clear \
		--backtitle "Estou a Ver" \
		--title "Registo" --insecure \
		--passwordbox "Palavra-Passe : " 0 0 2>&1 1>&3);
	exec 3>&-;
	openssl aes-256-cbc -a -salt -in

	ssh-keygen -b 2048 -t rsa -N $PSD -f ~/.ssh/keys -q;
	chmod 700 ~/.ssh
	chmod 400 ~/.ssh/keys
	clear
	export VERYFIED_IDENTITY=yes
	./estou_a_ver.sh
else
	exec 3>&1;
	PSD=$(dialog --clear \
		--backtitle "Estou a Ver" \
		--title "Registo" --insecure \
		--passwordbox "Palavra-Passe : " 0 0 2>&1 1>&3);
	exec 3>&-;
	ssh-keygen -y -f ~/.ssh/keys -P $PSD
	clear
	export VERYFIED_IDENTITY=yes
	./estou_a_ver.sh
fi
