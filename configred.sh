#!/bin/bash
echo "Bienvenido al configurador de red automático"
echo "Selecciona la red en el la que estás 10.0.0.0 por ejemplo"
read red
# El parámetro -z comprueba si la variable está vacía
if [ -z $red ]
    then
        echo "Debes introducir la dirección de red"
else
        echo "Ahora introduce la dirección ip de la máquina"
        read ip
        if [ -z $ip ]
            then
                echo "Debes introducir la máscara"
                exit
        else
            echo "Introduce la máscara de red"
            read netmask
            if [ -z $netmask ]
                then
                    echo "Debes introducir una mascara de red"
                    exit
            else
                "Introduce la dirección del servidor DNS por ejemplo 8.8.8.8"
                read dnsnameserver
                if [ -z $dnsnameserver ]
                    then
                        echo "Debes introducir la dirección del servidor dns"
                        exit
                else
                    echo "Introduce el dominio"
                    read search
                    if [ -z $search]
                        then
                            echo "Debes introducir el dominio"
                    else
                        sudo echo"auto enp0s3" >> /etc/network/interfaces
                        sudo echo"iface enp0s3 static" >> /etc/network/interfaces
                        sudo echo"addres $ip" >> /etc/network/interfaces
                        sudo echo"netmask $netmask" >> /etc/network/interfaces
                        sudo echo"network $red" >> /etc/network/interfaces
                        sudo echo"dns-nameservers $dnsnameserver" >> /etc/network/interfaces
                        sudo echo"search $search" >> /etc/network/interfaces
                    fi
                fi
            fi
        fi
fi