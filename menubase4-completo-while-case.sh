#!/bin/bash


function show_content {
  local dir=$1
  local option
  while true; do
    clear
    echo "Directorio actual: $dir"
    echo "Contenido:"
    ls $dir
    read -p "¿Qué quieres hacer? (C = Entrar en carpeta, L = Leer archivo, R = Retroceder, S = Salir): " option
    case $option in
      [Cc]) read -p "Escribe el nombre de la carpeta: " folder
            if [ -d "$dir/$folder" ]; then
              dir="$dir/$folder"
            else
              echo "La carpeta $folder no existe."
            fi;;
      [Ll]) read -p "Escribe el nombre del archivo: " file
            if [ -f "$dir/$file" ]; then
              cat "$dir/$file"
              read -p "Presiona enter para continuar."
            else
              echo "El archivo $file no existe."
            fi;;
      [Rr]) if [ "$dir" != "/" ]; then
              dir=$(dirname "$dir")
            else
              echo "Ya estás en la raíz del sistema."
            fi;;
      [Ss]) break;;
      *) echo "Opción inválida.";;
    esac
  done
}

read -p "¿Quieres entrar en una carpeta de home o del sistema? (H/S) " choice
choice=$(echo $choice | tr '[:lower:]' '[:upper:]')

if [ "$choice" == "H" ]; then
  dir=~
elif [ "$choice" == "S" ]; then
  dir="/"
else
  echo "Opción inválida."
  exit 1
fi

show_content $dir