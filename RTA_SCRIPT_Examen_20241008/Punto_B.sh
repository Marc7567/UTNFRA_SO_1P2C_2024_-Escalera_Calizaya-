#!/bin/bash
echo "particionamos el disco con 10G" 
sudo fdisk /dev/sdc
n
p


+1G 
n
p


+1G 
n
p


+1G 
e


n

+1G 
n

+1G 
n

+1G 
n

+1G 
n

+1G 
n

+1G 
n


w
echo "es hora de formatear las particiones"
for i in 1 2 3 4 5 6 7 8 9 10 11; do
    if [$i -ne 4]; then
        sudo mkfs -t ext4 /dev/sdc$i
    fi
echo "hora de montar los discos"
for i in 1 2 3 4 5 6 7 8 9 10; then
    for j in 1 2 3; then
        for x in 1 2 3; then
            if [$i -ne 4]; then
                echo "/dev/sdc$i /home/vagrant/repogit/Examenes-UTN/alumnos_$j/parcial_$x ext4 defaults 0 0" | sudo tee -a /etc/fstab
            fi
echo "/dev/sdc11 /home/vagrant/repogit/Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab 
sudo mount -a
echo "comprobamos que esten motados"
sudo lsblk
