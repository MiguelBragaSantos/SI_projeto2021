#!/bin/bash

if [ ! -f database.sha256.enc ]; then
	exec 3>&1;
	PSD=$(dialog --clear \
		--backtitle "Estou a Ver" \
		--title "Registo" --insecure \
		--passwordbox "Palavra-Passe : " 0 0 2>&1 1>&3);
	exec 3>&-;
        #echo $PSD
        openssl enc -aes-128-cbc -e -a -salt -pass pass:"${PSD}" -in <(./encrypt.sh) -out database.sha256.enc
        #ssh-keygen -b 2048 -t rsa -N $PSD -f ~/.ssh/keys -q;
	#chmod 700 ~/.ssh
	#chmod 400 ~/.ssh/keys
	clear
	export VERYFIED_IDENTITY=yes
	#./estou_a_ver.sh
else
	exec 3>&1;
	PSD=$(dialog --clear \
		--backtitle "Estou a Ver" \
		--title "Registo" --insecure \
		--passwordbox "Palavra-Passe : " 0 0 2>&1 1>&3);
	exec 3>&-;
	decrypted=$(./decrypt.sh $PSD)
	firstchar=${decrypted:0:1}
	if [[ $firstchar == "/" ]]; then
		dif=$(diff <(./encrypt.sh) <(./decrypt.sh $PSD) | grep "<" | while IFS=/ read junk name
		do
    		echo $name
		done | cut -d \= -f 1)
		#echo "/${dif}"
		#dif2="/$dif"
		#pwdb="$(pwd)/database.sha256.enc "
		# || "$dif2" = "$pwdb" 
		if [[ $dif = "" ]]; then 
			zenity --warning --ellipsize --no-wrap  --text="No changes in files\n"
		else
			zenity --warning --ellipsize --no-wrap  --text="Following files have changes\n $dif"
			rm database.sha256.enc
			openssl enc -aes-128-cbc -e -a -salt -pass pass:"${PSD}" -in <(./encrypt.sh) -out database.sha256.enc
		fi
	else
		clear
		zenity --warning --ellipsize --no-wrap --text="Get out of here you scoundrel!"
		exit
	fi
	#ssh-keygen -y -f ~/.ssh/keys -P $PSD
	clear
	export VERYFIED_IDENTITY=yes
	#./estou_a_ver.sh
fi
