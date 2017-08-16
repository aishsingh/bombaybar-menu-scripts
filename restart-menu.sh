#!/bin/sh

IP_SCREEN1=192.168.0.100
IP_SCREEN2=192.168.0.101
IP_SCREEN3=192.168.0.102
DIR=/Users/NoelMacBook/Desktop/bombaybar-rpi

if $(ping -c 1 $IP_SCREEN1 &> /dev/null) 
then
    echo Restarting Screen1
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN1 '{ sleep 1; sudo reboot -f; } >/dev/null &'
else
    echo "Cannot connect to screen1!"
fi

if $(ping -c 1 $IP_SCREEN2 &> /dev/null) 
then
    echo Restarting Screen2
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN2 '{ sleep 1; sudo reboot -f; } >/dev/null &'
else
    echo "Cannot connect to screen2!"
fi

if $(ping -c 1 $IP_SCREEN3 &> /dev/null) 
then
    echo Restarting Screen3
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN3 '{ sleep 1; sudo reboot -f; } >/dev/null &'
else
    echo "Cannot connect to screen3!"
fi
