#!/usr/bin/bash

# -------Nome----------
echo "-------Nome----------"
echo $0

# -------Aula 7--------
var_1=$1
var_2=$2

# Condicional Completa:
if [[ "$var_1" = "$var_2" ]]
    then
        echo "São iguais."

elif [[ "$var_1" = 1 ]]
    then
        echo "elif."

else alternate-consequents
    echo "Else"

fi

# Condicional forma Reduzida:
[ 1 = 1 ] && echo "Verdadeiro" 
[ 1 = 0 ] || echo "Falso" 

# Output:
echo "Todos os parametros $: $*"


