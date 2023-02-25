# Obtener la lista de archivos .sh en la ruta actual
scripts=( $(ls *.sh) )

# Iterar a través de los nombres de archivo de script y ejecutarlos uno por uno
for script in "${scripts[@]}"
do
  echo "Ejecutando el script: $script"
  bash "$script"
  echo "El script $script ha terminado"
done

# Este script me muestra los archivos de la ruta actual me pideel nombre introduzco y me muestra el codigo del archivo y me pide de que linea a que linea quiero copiar curioso