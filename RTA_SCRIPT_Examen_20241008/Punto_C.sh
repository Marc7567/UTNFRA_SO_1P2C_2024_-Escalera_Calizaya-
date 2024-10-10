#!/bin/bash
cd ..
echo "creamos los grupos"
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores
echo "creamos los usuarios y sus contrasenas, luego los agregamos a sus respectivos grupos"
for i 1 2 3 4; do
 if [$i -eq 4]; then
  sudo useradd -m -s /bin/bash -c "profesor 1" -G p1c2_2024_gProfesores -p "$(sudo grep -i vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_P1
 else
  sudo useradd -m -s /bin/bash -c "Alumno $i" -G p1c2_2024_gAlumno -p "$(sudo grep -i vagrant /etc/shadow | awk -F ':' '{print $2}')" p1c2_2024_A$i
 fi
echo "ahora cambiamos de el grupo y propietario a las carpetas alumnos y profesores"
for i 1 2 3 4; do
 if [$i -eq 4]; then
  sudo chown p1c2_2024_P1:p1c2_2024_gProfesores Examenes-UTN/profesores
 else
  sudo chown p1c2_2024_A$i:p1c2_2024_A$i Examenes-UTN/alumnos_$i
 fi
echo "crear archivo validar.txt con whoami" (ver si se debe hacer antes de cambiar los permisos)
for i 1 2 3 4; do
 if [$i -eq 4]; then
  whoami > validar.txt | mv validar.txt Examenes-UTN/profesores
 else
  whoami > validar.txt | mv validar.txt Examenes-UTN/alumnos_$i
 fi
echo "ahora cambiamos los permisos de las carpetas"
sudo chmod 750 Examenes-UTN/alumnos_1
sudo chmod 760 Examenes-UTN/alumnos_2
sudo chmod 700 Examenes-UTN/alumnos_3
sudo chmod 775 Examenes-UTN/profesores
echo "llamamos a los archivos validar"
for i 1 2 3 4; do
 if [$i -eq 4]; then
  sudo -su -c "whoami > /Examenes-UTN/profesores/validar.txt" p1c2_2024_P1
 else
  sudo -su -c "whoami > /Examenes-UTN/alumnos_$i/validar.txt" p1c2_2024_A$i
 fi
