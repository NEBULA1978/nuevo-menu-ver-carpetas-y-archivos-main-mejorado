green/bash

#Colors
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

while :; do
  clear
  echo -e "\n${greenColour} MENU SCRIPT V.2${endColour}\n"
  echo -e "${greenColour}[1]${endColour}${greenColour} Mostrar directorio${endColour}"
  echo -e "${greenColour}[2]${endColour}${greenColour} Mostrar calendario${endColour}"
  echo -e "${greenColour}[3]${endColour}${greenColour} Mostrar fecha y hora${endColour}"
  echo -e "${greenColour}[4]${endColour}${greenColour} Ver archivos ocultos${endColour}"
  echo -e "${greenColour}[5]${endColour}${greenColour} Ejecutando script para entrar en carpetas y leer archivos${endColour}"
  echo -e "${greenColour}[7]${endColour}${greenColour} Ejecutando script para leer archivo le digamos y de la linea nº 1 a la linea nº3 y guarde en archivo numerado distinto cada vez que ejecutamos...${endColour}"
  echo -e "${greenColour}[8]${endColour}${greenColour} Modificar archivo con contenido de otro archivo${endColour}"
  echo -e "${greenColour}[6]${endColour}${greenColour} Salir\n"

  echo -n "Escoger opción: "
  read opcion

  case $opcion in
    1)
      echo -e "\n${blueColour}Mostrando directorio${endColour}\n"
      ls
      # echo -e "${blueColour}ls${endColour}" me sale ls con color solo
      read foo
      ;;
    2)
      echo -e "\n${blueColour}Mostrando calendario${endColour}\n"
      cal
      read foo
      ;;
    3)
      echo -e "\n${blueColour}Mostrando fecha y hora${endColour}\n"
      date
      read foo
      ;;
    4)
      echo -e "\n${blueColour}Mostrando archivos ocultos${endColour}\n"
      ls -a
      read foo
      ;;
    5)
      echo -e "\n${blueColour}Ejecutando script para entrar en carpetas y leer archivos...${endColour}\n"
      # Aquí es donde se ejecutaría el script
      # Por ejemplo:
      ./ver-cartetas-linux1-mejorado3.sh
      read foo
      ;;
    7)
      echo -e "\n${blueColour}Ejecutando script para leer archivo le digamos y de la linea nº 1 a la linea nº3 y guarde en archivo numerado distinto cada vez que ejecutamos...${endColour}\n"
      # Aquí es donde se ejecutaría el script
      # Por ejemplo:
      ./copiar-sede-contador.sh
      read foo
      ;;
    8)
      echo -e "\n${blueColour}Modificando archivo con contenido de otro archivo...${endColour}\n"
      # Preguntar por el nombre del archivo a modificar
      lsd -l
      echo -n "Introduce el nombre del archivo a modificar: "
      read file1
      # Preguntar por el nombre del archivo que contiene las líneas a agregar
      echo -n "Introduce el nombre del archivo con las líneas a agregar: "
      read file2
      # Preguntar por las líneas a agregar
      echo -n "Introduce las líneas a agregar (separadas por espacios): "
      read lines

      # Modificar el archivo con las líneas especificadas
      for line in $lines; do
        sed -i "${line}r ${file2}" ${file1}
      done

      echo -e "\n${greenColour}Archivo modificado exitosamente${endColour}\n"
        read foo
        ;;
    6) 
      echo -e "\n${redColour}[!] Saliendo...${endColour}\n"
      exit 0
      ;;
    *)
      echo -e "\n${redColour}[ERROR] Opción inválida...${endColour}"
      sleep 1
      ;;
  esac
done
