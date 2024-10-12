#!/bin/bash
echo "creamos los grupos"
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores
echo "creamos los usuarios y sus contrasenas, luego los agregamos a sus respectivos grupos"
for i in 1 2 3 4; do
   if [$i -eq 4]; then
       sudo useradd -m -s /bin/bash -c "profesor 1" -G p1c2_2024_gProfesores -p "$(sudo grep -i vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_P1
   else
       sudo useradd -m -s /bin/bash -c "Alumno $i" -G p1c2_2024_gAlumno -p "$(sudo grep -i vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A$i
   fi
done
echo "ahora cambiamos el grupo y propietario a las carpetas alumnos y profesores"
for i in 1 2 3 4; do
   if [$i -eq 4]; then
       sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/Examenes-UTN/profesores
   else
       sudo chown p1c2_2024_A$i:p1c2_2024_A$i /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/Examenes-UTN/alumnos_$i
   fi
done
echo "crear archivo validar.txt con whoami"
for i in 1 2 3 4; do
   if [$i -eq 4]; then
       whoami > validar.txt | mv validar.txt /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/Examenes-UTN/profesores
   
   else
       whoami > validar.txt | mv validar.txt /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/Examenes-UTN/alumnos_$i
   fi
done
echo "ahora cambiamos los permisos de las carpetas"
sudo chmod 750 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/Examenes-UTN/alumnos_1
sudo chmod 760 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/Examenes-UTN/alumnos_2
sudo chmod 700 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/Examenes-UTN/alumnos_3
sudo chmod 775 /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/Examenes-UTN/profesores
echo "llamamos a los archivos validar"
for i in 1 2 3 4; do
   if [$i -eq 4]; then
       sudo -su -c "whoami > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-/Examenes-UTN/profesores/validar.txt" p1c2_2024_P1
   else
       sudo -su -c "whoami > /home/vagrant/repogit/UTNFRA_SO_1P2C_2024_-Escalera_Calizaya-//Examenes-UTN/alumnos_$i/validar.txt" p1c2_2024_A$i
   fi
done
