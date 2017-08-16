#!/bin/sh

IP_SCREEN2=192.168.0.101
DIR=/Users/NoelMacBook/Desktop/bombaybar-rpi

if $(ping -c 1 $IP_SCREEN2 &> /dev/null) 
then
    echo Sending screen2.ppm to Screen2
    scp -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa $DIR/screen2.ppm tc@$IP_SCREEN2:/home/tc/fb.ppm
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN2 "filetool.sh -b"

    echo

    echo Restarting Screen2
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN2 '{ sleep 1; sudo reboot -f; } >/dev/null &'
else
    echo "Cannot connect to screen2!"
fi
