#!/bin/bash

function controlC() {
  # Parar la ejecución en caso de Ctrl+C
  echo -e "\n\n[!] Saliendo...\n"
  exit 1
}

# Capturar la señal de Ctrl+C y redirigirla a la función controlC
trap controlC INT

# Revisar si el archivo log.log ya existe, y si es así, no ejecutar curl de nuevo
if [ ! -f log.log ]; then
  # Descargar la página y guardarla en el archivo log.log
  curl https://www.vulnhub.com/ >log.log 2>/dev/null
fi

# Función para mostrar los nombres de las máquinas
function show_machine_names() {
  cat log.log2
}

echo "Estas son las máquinas disponibles:"

# Inspeccionamos la etiqueta del contexto que queramos consultar
# patrón en común a href="/entry/ de etiquetas HTML | tr elimino # | sed elimino un patrón y pongo otra cosa | awk imprímeme la columna 3 | sed elimino /entry/ del resultado | uniq no se repita ninguna fila
grep -o 'href="/entry/[^"]*' log.log | sed 's/href="//' | awk -F ',' '{print $1}' | sed 's|/entry/||' | uniq >log.log2

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
fi

# ¡Por supuesto! El script es un programa en bash que descarga una página web de https://www.vulnhub.com/ y muestra los nombres de las máquinas disponibles en esa página web.

# Aquí está una descripción detallada de lo que hace el script paso a paso:

#     Define una función "controlC" que se ejecuta cuando se pulsa Ctrl+C.
#     Configura una trampa para la señal INT (Ctrl+C), de modo que si se pulsa Ctrl+C, la función controlC se ejecuta.
#     Comprueba si el archivo log.log existe y, si no existe, descarga la página web y guarda el resultado en log.log.
#     Define una función "show_machine_names" que muestra los nombres de las máquinas disponibles leyendo la información del archivo log.log2.
#     Busca los nombres de las máquinas disponibles en la página web descargada y los guarda en un archivo llamado log.log2.
#     Pregunta al usuario si desea ver los nombres de las máquinas. Si el usuario responde "s", muestra los nombres de las máquinas utilizando la función "show_machine_names".
#     Si el usuario responde "s" para buscar nuevas máquinas, el script descarga la página web y comprueba si hay máquinas nuevas comparando con la versión anterior de log.log. Si hay nuevas máquinas, borra la versión anterior de log.log y descarga la página web nuevamente. Después de eso, pregunta al usuario el nombre de la máquina que desea buscar y muestra los resultados si la máquina existe.
#     El script muestra si hay o no hay nuevas máquinas después de buscar una máquina específica.
