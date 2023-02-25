#!/bin/bash

# ><

# Vamos al explorador y copiamos la pagina que queramos
# Enviamos a un documento la peticion
# El output no queremos ver redigimos a dev/nul
curl https://www.vulnhub.com/ >log.log 2>/dev/null

echo "Estas son las maquina disponibles: "

# Inspeccionamos la etiqueta del contexto que queramos consultar
# patron en comun a href=/entry/ de etiquetas html | tr elimino # | sed elimino un patron y pongo otra cosa | awk imprimeme la columna3 | unic no se repita nimguna fila

# echo "$(cat log.log | grep 'href="/entry/' | tr -d '#' | sed 's/entry/vm/' | awk '{print $3}' | tr -d '/' | sed 's/dowload/ /' | awk '{print $2}' | tr -d '>' | uniq)"
# cat log.log | grep 'href="/entry/' | tr -d '#' | sed 's/entry/vm/' | awk '{print $3}' | tr -d '/' | sed 's/dowload/ /' | awk '{print $2}' | tr -d '>' | uniq
# Mostrar comandos por consola
# echo "cat log.log | grep 'href=/entry/' | tr -d '#' | sed 's/entry/ /' | awk '{print $3}' | tr -d '/' | sed 's/dowload/ /' | sed 's/ /' | tr -d '>'"

# cat log.log | grep 'href=/entry/' | tr -d '#' | sed 's/entry/ /' | awk '{print }' | tr -d '/' | sed 's/dowload/ /' | sed 's/ /' | tr -d '>' | tr -d ' ' | uniq
