#!/bin/bash

# Comprobar si se han introducido al menos 5 parámetros
if [ $# -lt 5 ]; then
  echo "Se necesitan al menos 5 parámetros."
  read -p "Introduce al menos 5 parámetros separados por espacios: " parametros
  set -- $parametros
fi

# Mostrar la cantidad de parámetros introducidos
echo "Se han introducido $# parámetros."

# Mostrar los valores de los tres primeros parámetros
echo "Los tres primeros parámetros son: $1, $2, $3."

# Este script comprueba si se han introducido al menos 5 parámetros. Si se han introducido menos, pide al usuario que introduzca al menos 5 parámetros separados por espacios y establece esos parámetros como los parámetros del script.

# Luego, muestra la cantidad de parámetros que se han introducido y los valores de los tres primeros parámetros.

# El primer if comprueba si el número de argumentos pasados al script (representado por $#) es menor que 5. Si es así, el script muestra un mensaje indicando que se necesitan al menos 5 parámetros y luego solicita al usuario que introduzca al menos 5 parámetros separados por espacios. La variable "parametros" almacena la entrada del usuario.

# Luego, la instrucción "set -- $parametros" establece los parámetros del script a los valores introducidos por el usuario.

# El siguiente bloque de código muestra la cantidad de parámetros que se han introducido y los valores de los tres primeros parámetros. La variable $# representa la cantidad de parámetros introducidos, mientras que $1, $2 y $3 representan el primer, segundo y tercer parámetro, respectivamente.