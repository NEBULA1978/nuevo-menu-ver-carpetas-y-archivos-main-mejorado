#!/bin/bash

# Preguntar al usuario por los parámetros hasta que se hayan introducido al menos 5
while [ $# -lt 5 ]; do
  read -p "Se necesitan al menos 5 parámetros. Introduce al menos 5 parámetros separados por espacios: " parametros
  set -- $parametros
done

# Mostrar la cantidad de parámetros introducidos
echo "Se han introducido $# parámetros."

# Mostrar los valores de los tres primeros parámetros
echo "Los tres primeros parámetros son: $1, $2, $3."

# En este script, la estructura while se encarga de pedir al usuario que introduzca los parámetros hasta que se hayan introducido al menos 5. Si se han introducido al menos 5 parámetros, el script sigue adelante y muestra la cantidad de parámetros introducidos y los valores de los tres primeros, como en la versión anterior. De esta forma, si el usuario no introduce al menos 5 parámetros al ejecutar el script, el script le pedirá que los introduzca de nuevo hasta que se hayan introducido al menos 5.