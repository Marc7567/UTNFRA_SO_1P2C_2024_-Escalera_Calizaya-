#!/bin/bash
cd ..
echo "creamos el archivo Filtro_Basico.txt"
touch /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
echo "agregamos la info de Memoria Ram al archivo Filtro_Basico.txt"
sudo cat /proc/meminfo | grep -i memtotal > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
echo "agregamos la info del chassis del pc"
sudo dmidecode -t chassis | grep -i cha >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
sudo dmidecode -t chassis | grep -i manu >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
echo "mostramos la info del archivo"
echo ""
cat /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Basico.txt
