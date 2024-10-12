#!/bin/bash
echo "particionamos el disco con 10G"
sudo parted /dev/sdc --script mklabel gpt
for i in {1..3}; do
   sudo parted /dev/sdc --script mkpart primary ext4 $(($i * 1))GB $(($i * 1 + 1))GB
done
for i in {5..11}; do
   sudo parted /dev/sdc --script mkpart primary ext4 $(($i * 1 -1))GB $(($i * 1))GB
done

echo "es hora de formatear las particiones"
for i in {1..11}; do
    if [$i -ne 4]; then
        sudo mkfs -t ext4 /dev/sdc$i
    fi
done
echo "hora de montar los discos"
for i in {1..11}; do
   for j in 1 2 3; do
       for x in 1 2 3; do
           if [$i -ne 4]; then
	       echo "/dev/sdc$i /home/vagrant/repogit/Examenes-UTN/alumnos_$j/parcial_$x ext4 defaults 0 0" | sudo tee -a /etc/fstab
           fi
       done
   done
done
echo "/dev/sdc11 /home/vagrant/repogit/Examenes-UTN/profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab 
sudo mount -a
echo "comprobamos que esten motados"
sudo lsblk
