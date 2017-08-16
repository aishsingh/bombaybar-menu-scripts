#!/bin/sh

IP_SCREEN1=192.168.0.100
DIR=/Users/NoelMacBook/Desktop/bombaybar-rpi

if $(ping -c 1 $IP_SCREEN1 &> /dev/null) 
then
    echo Sending screen1.ppm to Screen1
    scp -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa $DIR/screen1.ppm tc@$IP_SCREEN1:/home/tc/fb.ppm
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN1 "filetool.sh -b"

    echo

    echo Restarting Screen1
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN1 '{ sleep 1; sudo reboot -f; } >/dev/null &'
else
    echo "Cannot connect to screen1!"
fi
