#!/bin/bash

OPTIONS=(1 "Adicionar ficheiro."
	2 "Adicionar Diretoria."
	3 "sair" )

CHOICE=$(dialog --clear \
	--backtitle "SO2021" \
	--title "Adicionar Ficheiros ou Diretorias" \
	--menu "Escolha um dos seguintes :"\
	 15 40 4 \
	"${OPTIONS[@]}"\
	2>&1 >/dev/tty)

clear
case $CHOICE in
	1)
		dialog --clear \
		--backtitle "SO2021" \
		--title "Adicionar um ficheiro" \
		--inputbox "nome do ficheiro:" \
		8 40 2>ans.txt
		val=$(<ans.txt)
		nano $val
		rm -f ans.txt
		;;
	2)
		dialog --clear \
		--backtitle "SO2021" \
		--title "Adicionar uma Diretoria" \
		--inputbox "nome da diretoria:" \
		8 40 2>ans.txt
		val=$(<ans.txt)
		mkdir $val
		rm -f ans.txt
		;;

	3)
		bash ./backup_system.sh
		;;
esac
