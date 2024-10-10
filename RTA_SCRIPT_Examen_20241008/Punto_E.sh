#!/bin/bash
cd ..
echo "creamos el archivo Filtro_Basico.txt"
touch RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
echo "agregamos la info de Memoria Ram al archivo Filtro_Basico.txt"
sudo cat /proc/meminfo | grep -i memtotal > RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
echo "agregamos la info del chassis del pc"
sudo dmidecode -t chassis | grep -i cha >> RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
sudo dmidecode -t chassis | grep -i manu >> RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
echo "mostramos la info del archivo"
cat RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
