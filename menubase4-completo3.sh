#!/bin/bash


function show_content {
  local dir=$1
  local option
  while true; do
    clear
    echo "Directorio actual: $dir"
    echo "Contenido:"
    ls $dir
    read -p "¿Qué quieres hacer? (E = Entrar en carpeta, L = Leer archivo, X = Ejecutar archivo, R = Retroceder, C = Copiar archivo, S = Salir): " option
    case $option in
      [Ee]) read -p "Escribe el nombre de la carpeta: " folder
            if [ -d "$dir/$folder" ]; then
              dir="$dir/$folder"
            else
              echo "La carpeta $folder no existe."
            fi;;
      [Ll]) read -p "Escribe el nombre del archivo: " file
            if [ -f "$dir/$file" ]; then
              cat "$dir/$file"
              read -p "¿Quieres copiar desde la línea 1 hasta la línea 10 en un nuevo archivo? (S/N) " copy_option
              copy_option=$(echo $copy_option | tr '[:lower:]' '[:upper:]')
              if [ "$copy_option" == "S" ]; then
                head -n 10 "$dir/$file" > "$dir/archivo-copia-lineas.txt"
                echo "Archivo copiado como archivo-copia-lineas.txt en el directorio actual."
              fi
              read -p "Presiona enter para continuar."
            else
              echo "El archivo $file no existe."
            fi;;
      [Xx]) read -p "Escribe el nombre del archivo: " file
            if [ -f "$dir/$file" ]; then
              case "$file" in
                *.sh) bash "$dir/$file";;
                *.py) python3 "$dir/$file";;
                *.js) node "$dir/$file";;
                *) echo "No se puede ejecutar el archivo $file. Extensión desconocida.";;
              esac
              read -p "Presiona enter para continuar."
            else
              echo "El archivo $file no existe."
            fi;;
      [Rr]) if [ "$dir" != "/" ]; then
              dir=$(dirname "$dir")
            else
              echo "Ya estás en la raíz del sistema."
            fi;;
      [Cc]) read -p "Escribe el nombre del archivo a copiar: " source_file
            if [ -f "$dir/$source_file" ]; then
              read -p "Escribe el nombre del archivo de destino: " dest_file
              cp "$dir/$source_file" "$dir/$dest_file"
              echo "Archivo copiado como $dest_file en el directorio actual."
            else
              echo "El archivo $source_file no existe."
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
