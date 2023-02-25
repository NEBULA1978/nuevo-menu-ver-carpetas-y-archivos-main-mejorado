# Realice un script que reciba por parametros un minimo de 5
# datos y nos diga cuantos se han introducido y el valor de los tres
# primeros

#!/bin/bash

# Comprobar si se han introducido al menos 5 parámetros
if [ $# -lt 5 ]; then
  echo "Se necesitan al menos 5 parámetros."
  exit 1
fi

# Mostrar la cantidad de parámetros introducidos
echo "Se han introducido $# parámetros."

# Mostrar los valores de los tres primeros parámetros
echo "Los tres primeros parámetros son: $1, $2, $3."

#  ./mi_script.sh parametro1 parametro2 parametro3 parametro4 parametro5 parametro6
# Se han introducido 6 parámetros.
# Los tres primeros parámetros son: parametro1, parametro2, parametro3.
# Nota que el script comprueba si se han introducido al menos 5 parámetros y muestra un mensaje de error si no es así. Si se han introducido al menos 5 parámetros, muestra la cantidad de parámetros introducidos y los valores de los tres primeros. Puedes modificar el script según tus necesidades.