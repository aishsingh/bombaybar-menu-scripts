#!/bin/sh

IP_SCREEN3=192.168.0.102
DIR=/Users/NoelMacBook/Desktop/bombaybar-rpi

if $(ping -c 1 $IP_SCREEN3 &> /dev/null) 
then
    echo Sending screen3.ppm to Screen3
    scp -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa $DIR/screen3.ppm tc@$IP_SCREEN3:/home/tc/fb.ppm
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN3 "filetool.sh -b"

    echo

    echo Restarting Screen3
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN3 '{ sleep 1; sudo reboot -f; } >/dev/null &'
else
    echo "Cannot connect to screen3!"
fi
