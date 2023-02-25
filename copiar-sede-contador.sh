#!/bin/bash
clear 
ls -l
echo "Introduce el nombre del archivo:"
read archivo
echo
printf " 1  2  3\n"
batcat $archivo
echo "Desde qué línea desea copiar?"
read inicio
echo "Hasta qué línea desea copiar?"
read fin

# Añadir un contador al nombre de archivo resultado
counter=0
while [ -e "resultado$counter.txt" ]
do
  counter=$((counter + 1))
done

# Guardar las líneas seleccionadas en un archivo resultado con el contador
sed -n "${inicio},${fin}p" "$archivo" >> resultado$counter.txt
echo
echo "Las líneas seleccionadas se han guardado en resultado$counter.txt"
