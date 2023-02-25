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

# Función para mostrar los nombres de las máquinas
function show_machine_names() {
  cat log.log2
}

# Preguntar al usuario si desea ver los nombres de las máquinas
read -p "¿Desea ver los nombres de las máquinas (s/n)? " response

if [ "$response" == "s" ]; then
  show_machine_names

  # Preguntar al usuario si desea buscar nuevas máquinas
  read -p "¿Desea buscar nuevas máquinas (s/n)? " response

  if [ "$response" == "s" ]; then
    # Descargar la página y guardarla en el archivo log.log
    curl https://www.vulnhub.com/ >log.log 2>/dev/null

    # Buscar la palabra "noob" en el archivo log.log y redirigir la salida a /dev/null para no mostrarla
    cat log.log | grep noob >/dev/null

    # Si el comando anterior se ha ejecutado correctamente, devuelve un 1
    if [ $? -eq 0 ]; then
      echo "No hay ninguna máquina nueva"
      new_machines=0
    else
      echo "¡Hay máquinas nuevas!"
      rm log.log
      new_machines=1
    fi

    # Preguntar al usuario el nombre de la máquina a buscar
    read -p "Introduce el nombre de la máquina a buscar: " machine_name

    # Buscar el nombre de la máquina en el archivo log.log2 y mostrar el resultado
    if grep -q "$machine_name" log.log2; then
      grep "$machine_name" log.log2
    else
      echo "El nombre de la máquina no existe"
    fi

    # Mostrar si hay o no hay máquinas nuevas después de buscar una máquina específica
    if [ $new_machines -eq 1 ]; then
      echo "¡Hay máquinas nuevas!"
    else
      echo "No hay máquinas nuevas"
    fi
  fi
else
  # Preguntar al usuario si desea buscar nuevas máquinas
  read -p "¿Desea buscar nuevas máquinas (s/n)? " response

  if [ "$response" == "s" ]; then
    # Descargar la página y guardarla en el
    # Descargar la página y guardarla en el archivo log.log
    curl https://www.vulnhub.com/ >log.log 2>/dev/null

    # Buscar la palabra "noob" en el archivo log.log y redirigir la salida a /dev/null para no mostrarla
    cat log.log | grep noob >/dev/null

    # Si el comando anterior se ha ejecutado correctamente, devuelve un 1
    if [ $? -eq 0 ]; then
      echo "No hay ninguna máquina nueva"
    else
      echo "¡Hay máquinas nuevas!"
      rm log.log
    fi

    # Preguntar al usuario el nombre de la máquina a buscar
    read -p "Introduce el nombre de la máquina a buscar: " machine_name

    # Buscar el nombre de la máquina en el archivo log.log2 y mostrar el resultado
    if grep -q "$machine_name" log.log2; then
      grep "$machine_name" log.log2
    else
      echo "El nombre de la máquina no existe"
    fi
  fi
fi

# En esta segunda parte del código, preguntamos al usuario si quiere buscar nuevas máquinas, y si responde que sí, descargamos la página y buscamos si hay nuevas máquinas o no. Después, preguntamos al usuario el nombre de la máquina a buscar y buscamos el nombre en el archivo log.log2. Si el nombre existe, mostramos el resultado. Si no existe, mostramos un mensaje indicando que el nombre no existe.
