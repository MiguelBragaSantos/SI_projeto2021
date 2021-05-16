#!/bin/bash

mkdir -p ~/Backups;

chmod +x ./menu_1.sh
chmod +x ./menu_2.sh
chmod +x ./backup.sh



OPTIONS=(1 "Inserir Ficheiro e Diretorias."
	2 "Remover Ficheiro e Diretorias."
	3 "Alterar Periodicidade de Backup."
	4 "Listar Ficheiros em Backup."
	5 "Restaurar ficheiro."
	6 "Fazer Backup agora."
	7 "sair" )
n=0

while (( $n != 1 ))
do
	CHOICE=$(dialog --clear \
		--backtitle "SO2021" \
		 --title "Menu Principal" \
		--menu "Escolha uma da opções:"\
		 15 40 4 \
		"${OPTIONS[@]}"\
		2>&1 >/dev/tty)
	case $CHOICE in
		1)
			bash ./menu_1.sh
			;;
		2)
			bash ./menu_2.sh
			;;

		3)
			crontab -e
			;;

		4)
			tar -tf ~/Backups/backups.tar.bz2
			echo "Precione qualquer tecla para continuar"
			while [ true ] ; do
			read -t 3 -n 1
			if [ $? = 0 ] ; then
			exit ;
			fi
			done
			;;

		5)
			dialog --clear \
			--backtitle "SO2021" \
			--title "Recuperar ficheiro" \
			--inputbox "PATH para o ficheiro a recuperar:" \
			8 40 2>ans.txt
			val=$(<ans.txt)
			tar -xf ~/Backups/backups.tar.bz2 home/a/${val}
			;;

		6)
			rm ~/Backups/backups.tar.bz2
			bash ./backup.sh
			;;
		7)
			n=$(( 1 ))
			echo "GOODBYE"
			;;
	esac
done
