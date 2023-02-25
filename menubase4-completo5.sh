#!/bin/bash

function show_content {
  local dir=$1
  local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"  # Obtiene la carpeta del script
  local option
  while true; do
    clear
    echo "Directorio actual: $dir"
    echo "Contenido:"
    ls $dir
    echo "Directorio Anterior: $cd .."
    echo "Contenido:"
    ls $cd ..
    read -p "¿Qué quieres hacer? (X = Entrar en carpeta, L = Leer archivo, E = Ejecutar archivo, R = Retroceder, C = Copiar, S = Salir): " option
    case $option in
      [Xx]) read -p "Escribe el nombre de la carpeta: " folder
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
                copy_file="$script_dir/$file"  # Copia en la carpeta del script original
                head -n 10 "$dir/$file" > "$copy_file"
                echo "Archivo copiado como $copy_file."
              fi
              read -p "Presiona enter para continuar."
            else
              echo "El archivo $file no existe."
            fi;;
      [Ee]) read -p "Escribe el nombre del archivo: " file
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
      [Cc]) read -p "¿Quieres copiar un archivo o una carpeta? (A = Archivo, B = Carpeta): " copy_choice
            copy_choice=$(echo $copy_choice | tr '[:lower:]' '[:upper:]')
            if [ "$copy_choice" == "A" ]; then
              read -p "Escribe el nombre del archivo: " file
              if [ -f "$dir/$file" ]; then
                read -p "Escribe el nombre del archivo de destino: " dest_file
                cp "$dir/$file" "$dir/$dest_file"
                echo "Archivo copiado como $dir/$dest_file."
              else
                echo "El archivo $file no existe."
              fi
            elif [ "$copy_choice" == "B" ]; then
              read -p "Escribe el nombre de la carpeta: " folder
             if [ -d "$dir/$folder" ]; then
read -p "Escribe el nombre del archivo: " file
if [ -f "$dir/$file" ]; then
cp "$dir/$file" "$dir/$folder/$file"
echo "Archivo copiado a la carpeta $folder."
else
echo "El archivo $file no existe."
fi
else
echo "La carpeta $folder no existe."
fi
read -p "Presiona enter para continuar."
else
echo "Opción inválida."
read -p "Presiona enter para continuar."
fi;;
[Ss]) exit;;
*) echo "Opción inválida."
read -p "Presiona enter para continuar.";;
esac
done
}

show_content $1
