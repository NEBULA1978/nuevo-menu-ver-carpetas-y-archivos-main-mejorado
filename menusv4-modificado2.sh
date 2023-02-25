# incluir una comprobación de si el usuario ha introducido una entrada válida o no. Si no ha introducido una entrada válida, se mostrará el panel de ayuda. Aquí está la nueva versión del script:

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
  echo -e "\n[!] Por favor, introduzca una cantidad de dinero y una técnica de apuestas válida. Las técnicas disponibles son martingala, d'Alembert y Paroli.\n"
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
    helpPanel
  fi
else
  helpPanel
fi
