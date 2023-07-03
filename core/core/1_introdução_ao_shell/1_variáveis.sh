#!/usr/bin/bash

# -------Nome----------
echo "-------Nome----------"
echo $0

# -------Aula 5--------
NOME="Samuel Evangelista"
IDADE=20
expectativa_de_vida=2000
idade_mais_expectativa_de_vida=$((IDADE+expectativa_de_vida))
SAIDA_CAT="$(cat /etc/passwd | grep guerrlr0)"

echo "-------Aula 5--------"
echo "$NOME"
echo "$IDADE"
echo "$expectativa_de_vida"
echo "$idade_mais_expectativa_de_vida"
echo "$SAIDA_CAT"
echo "----------------------"

# -------Aula 6--------
echo "-------Aula 6--------"
echo "Parametros 1: $1"
echo "Parametros 2: $2"
echo "Todos os parametros $: $*"
echo "Quantidade de parametros $: $#"
echo "Saída do último comando $: $?"
echo "PID: $$"



