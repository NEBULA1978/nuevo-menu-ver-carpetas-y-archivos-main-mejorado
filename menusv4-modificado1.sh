#!/bin/bash

function controlC(){
    # Parametro -epara que me aplique los saltos de linea
    echo -e "\n\n[!] Saliendo...\n"
  # Codigo de estado no exitoso
    exit 1  
}

# controlC
# Para capturr el atajo de teclado que acabo de escribir y redirijirlo a la funcion controlC
trap controlC INT

# Si no ccomento se ejecuta despues de 10 segundos
# sleep 10

#///////////////////////////////////////////
#///////////////////////////////////////////

function helpPanel(){
  echo -e "\n[!] Ayuda\n"
  exit 1
}

read -p "Introduzca la cantidad de dinero: " money
read -p "Introduzca la técnica de apuestas (martingala, d'Alembert, Paroli): " technique

if [ $money ] && [ $technique ]; then
  if [ $technique == "martingala" ]; then
    echo "Voy a jugar con $money dinero usando la tecnica Martingala"
  elif [ $technique == "d'Alembert" ]; then
    echo "Voy a jugar con $money dinero usando la tecnica D'Alembert"
  elif [ $technique == "Paroli" ]; then
    echo "Voy a jugar con $money dinero usando la tecnica Paroli"
  else
    echo "Técnica desconocida. Consulte el panel de ayuda (-h) para obtener información sobre las técnicas disponibles."
    exit 1
  fi
else
# Llamamos al panel de ayuda si me equivo al introducir parametros
  helpPanel
fi
