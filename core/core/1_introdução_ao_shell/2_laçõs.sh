#! /usr/bin/bash

# -------Nome----------
echo "-------Nome----------"
echo $0

# -------Aula 8--------

echo "-------for 1---------"
for (( i = 0; i < 10; i++ )) 
    do
        echo $i
done

echo "-------for 2---------"
for i in $(seq 10) 
    do
        echo $i
done

# -------Aula 9--------
fruta=(
    'Banana'
    'Abacaxi'
    'Maça'
)

echo "-------for 3---------"
for i in ${fruta[@]} 
    do
        echo $i
done

echo "-------for 4---------"
contandor=0
while [[ $contandor -lt ${#fruta[@]} ]]
    do
        echo $contandor
        contandor=$(($contador+1))
done

