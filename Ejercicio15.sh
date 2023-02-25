# Sí, se puede hacer un script que permita seleccionar 5 archivos con extensión .sh de la carpeta actual y ejecutarlos uno por uno. Aquí te dejo un ejemplo de cómo se podría hacer:

#!/bin/bash

# Mostrar los archivos .sh de la carpeta actual
echo "Archivos .sh disponibles en la carpeta actual:"
ls *.sh

# Seleccionar los 5 archivos .sh a ejecutar
echo "Selecciona los 5 archivos .sh a ejecutar (separados por espacios):"
read archivos

# Ejecutar los archivos seleccionados
for archivo in $archivos; do
  if [ -f "$archivo" ] && [ "${archivo##*.}" == "sh" ]; then
    echo "Ejecutando $archivo..."
    bash "$archivo"
    echo "$archivo ha terminado de ejecutarse."
  else
    echo "$archivo no es un archivo .sh válido."
  fi
done

# Este script muestra los archivos .sh disponibles en la carpeta actual, pide al usuario que seleccione los 5 archivos a ejecutar, y luego ejecuta cada archivo uno por uno utilizando el comando bash. Después de ejecutar cada archivo, el script muestra un mensaje indicando que el archivo ha terminado de ejecutarse.

