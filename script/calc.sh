#! /bin/bash

echo "Scegli un numero: "

read a

echo "Scegli un secondo numero: "

read b

echo "La somma è: $((a+b))"
echo "La differenza è: $((a-b))"
echo "Il prodotto è: $((a*b))"

if [ $b = 0 ];
then 
	echo "I due numeri non si possono dividere"
else
	echo "Il quoziente è: $((a/b))"
fi
