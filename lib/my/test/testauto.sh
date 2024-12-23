#!/bin/bash

nbtest=$[($RANDOM % ($[500 - 50] +1)) + 50]
test=1
result=0

while [ $test != $nbtest ] && [ $result = 0 ]
do
    signe1=$RANDOM
    signe2=$RANDOM
    nombre1=""
    nombre2=""

    if [ $signe1 -gt 16383 ]
    then
	nombre1="-"
    fi

    if [ $signe2 -gt 16383 ]
    then
	nombre2="-"
    fi

    nbnb1=$[($RANDOM % ($[500 - 20] + 1)) + 20]
    nbnb2=$[($RANDOM % ($[500 - 20] + 1)) + 20]

    i=0

    while [ $i != $nbnb1 ]
    do
	toadd=$[($RANDOM % 10)]
	if [ $i = 0 ] && [ $toadd = 0 ]
	then
	    toadd=1
	fi
	nombre1=$nombre1$toadd
	let "i = i + 1"
    done

    i=0

    while [ $i != $nbnb2 ]
    do 
	toadd=$[($RANDOM % 10)]
	if [ $i = 0 ] && [ $toadd = 0 ]
	then
	    toadd=1
	fi
	nombre2=$nombre2$toadd
	let "i = i + 1"
    done

    ../infin_add $nombre1 $nombre2 > test1
    echo $nombre1+$nombre2 | bc | tr -d '\n'| tr -d '\\' > result8
    echo "" >> result8
    diff test1 result8
    if [ $? = 1 ]
    then
	echo -e "\nEnter:"
	echo $nombre1
	echo -e "\nAnd:"
	echo $nombre2
	result=1
    fi
    echo "" > result8
done
