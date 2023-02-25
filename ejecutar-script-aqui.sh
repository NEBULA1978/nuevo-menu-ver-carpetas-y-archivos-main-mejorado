#!/bin/bash

# Lista de nombres de archivos de script a ejecutar
scripts=(
  copiar-sede-contador.sh
  directorios-linux-sv4
  ejercicioa-treas-cron.txt
  menubase.sh
  menubase-SV4.sh
  menubase-SV4-1.sh
  menubase-SV42.sh
  ver-cartetas-linux.sh
  ver-cartetas-linux1.sh
  ver-cartetas-linux1-mejorado.sh
  ver-cartetas-linux1-mejorado2.sh
  ver-cartetas-linux1-mejorado3.sh
  resultado0.txt
  resultado1.txt
)

# Iterar a través de los nombres de archivo de script y ejecutarlos uno por uno
for script in "${scripts[@]}"
do
  echo "Ejecutando el script: $script"
  bash "$script"
  echo "El script $script ha terminado"
done
