#!/bin/bash

# Colores
verde="\e[0;32m\033[1m"
rojo="\e[0;31m\033[1m"
azul="\e[0;34m\033[1m"
amarillo="\e[0;33m\033[1m"
morado="\e[0;35m\033[1m"
turquesa="\e[0;36m\033[1m"
gris="\e[0;37m\033[1m"
fin_color="\033[0m\e[0m"

# Función para mostrar el panel de ayuda
function help_panel() {
	echo -e "${amarillo}[*]${fin_color}${gris} Uso: ./script.sh${fin_color}"
	echo -e "\n\t${morado}a)${fin_color}${amarillo} Modo de ataque${fin_color}"
	echo -e "\t\t${rojo}Handshake${fin_color}"
	echo -e "\t\t${rojo}PKMID${fin_color}"
	echo -e "\t${morado}n)${fin_color}${amarillo} Nombre de la tarjeta de red${fin_color}"
	echo -e "\t${morado}h)${fin_color}${amarillo} Mostrar este panel de ayuda${fin_color}\n"
	exit 0
}

# Función para instalar las dependencias
function instalar_dependencias() {
	echo -e "${amarillo}[*]${fin_color}${gris} Instalando dependencias...${fin_color}"
	# Aquí puedes agregar el código para instalar las dependencias
}

# Función para iniciar el ataque
function iniciar_ataque() {
	echo -e "${amarillo}[*]${fin_color}${gris} Iniciando ataque...${fin_color}"
	# Aquí puedes agregar el código para iniciar el ataque
}

# Función principal

declare -i parameter_counter=0
while getopts ":a:n:h:" arg; do
	case $arg in
		a) attack_mode=$OPTARG; let parameter_counter+=1 ;;
		n) networkCard=$OPTARG; let parameter_counter+=1 ;;
		h) help_panel;;
	esac
done

if [ $parameter_counter -ne 2 ]; then
	help_panel
else
	instalar_dependencias
	iniciar_ataque
fi
