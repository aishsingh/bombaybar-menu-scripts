#!/bin/sh

IP_SCREEN1=192.168.0.100
IP_SCREEN2=192.168.0.101
IP_SCREEN3=192.168.0.102
DIR=/Users/NoelMacBook/Desktop/bombaybar-rpi

if $(ping -c 1 $IP_SCREEN1 &> /dev/null) 
then
    echo Sending screen1.ppm to Screen1
    scp -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa $DIR/screen1.ppm tc@$IP_SCREEN1:/home/tc/fb.ppm
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN1 "filetool.sh -b"
else
    echo "Cannot connect to screen1!"
fi

if $(ping -c 1 $IP_SCREEN2 &> /dev/null) 
then
    echo Sending screen2.ppm to Screen2
    scp -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa $DIR/screen2.ppm tc@$IP_SCREEN2:/home/tc/fb.ppm
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN2 "filetool.sh -b"
else
    echo "Cannot connect to screen2!"
fi

if $(ping -c 1 $IP_SCREEN3 &> /dev/null) 
then
    echo Sending screen3.ppm to Screen3
    scp -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa $DIR/screen3.ppm tc@$IP_SCREEN3:/home/tc/fb.ppm
    ssh -o StrictHostKeyChecking=no -i $DIR/ssh/id_rsa tc@$IP_SCREEN3 "filetool.sh -b"
else
    echo "Cannot connect to screen3!"
fi

echo
./restart-menu.sh
