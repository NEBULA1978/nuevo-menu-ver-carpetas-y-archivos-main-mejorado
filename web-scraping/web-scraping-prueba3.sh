#!/bin/bash

# Revisa si el archivo log.log ya existe y si es así, no ejecuta curl
if [ ! -f log.log ]; then
  # Vamos al explorador y copiamos la pagina que queramos
  # Enviamos a un documento la peticion
  # El output no queremos ver redigimos a dev/nul
  curl https://www.vulnhub.com/ >log.log 2>/dev/null
fi

echo "Estas son las maquinas disponibles: "

# Inspeccionamos la etiqueta del contexto que queramos consultar
# patron en comun a href=/entry/ de etiquetas html | tr elimino # | sed elimino un patron y pongo otra cosa | awk imprimeme la columna3 | sed elimino /entry/ del resultado | uniq no se repita ninguna fila
grep -o 'href="/entry/[^"]*' log.log | sed 's/href="//' | awk -F ',' '{print $1}' | sed 's|/entry/||' | uniq >log.log2

# Imprime el contenido de log.log2
cat log.log2

# Buscamos la palabra noob dentro del archivo log.log y el output al dev null para no ver
# Si no encuentra el nombre es que hay una pagina nueva, este nombre ha pasado a otra pagina
cat log.log | grep noob >/dev/null

# Si el comando anterior se ha ejecutado correctamente devuelve un 1
if [ $? -eq 0 ]; then
  echo "No hay ninguna maquina nueva"
else
  echo "Hay maquina nueva!!!"
  rm log.log
fi
