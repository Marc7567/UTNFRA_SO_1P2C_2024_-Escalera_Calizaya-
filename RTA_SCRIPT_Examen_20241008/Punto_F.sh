#!/bin/bash
echo "creamos el archivo Filtro_Avanzado.txt"
touch /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
echo "agregamos la info al Filtro_Avanzado.txt que hemos creado"
echo "Mi IP publica es : $(curl -s ifconfig.me | awk '{print$1}')" > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
echo "mi usuario es: $(whoami)" >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
echo "El Hash de mi usuario es: $(sudo grep -i vagrant /etc/shadow | awk -F ':' '{print $2}')" >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
echo "La URL de mi repositorio es: $(git remote get-url origin)" >> /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
cat /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/RTA_ARCHIVOS_Examen_20241008/Filtro_Avanzado.txt
