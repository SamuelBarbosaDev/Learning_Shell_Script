#!/usr/bin/bash
#
# 1_colorindo_nosso_programa.sh - Extrai usuários do /etc/passwd
# 
# Site:         https://github.com/SamuelBarbosaDev/
# Autor:        Samuel Barbosa
# Manutenção:   1.1.1
#
#
# ----------------------------------------------------- #
# Irá extrair usuarios do /etc/passwd, havendo a possibilidade
# de colocar em maiúsculo e em ordem alfabética.
# 
# Exemplo:
#   $ ./1_colorindo_nosso_programa.sh -s -m
#   Nesse exemplo ficará em maiúsculo e em ordem alfabética.
#
# ----------------------------------------------------- #
# Histórico:
#
#   v1.0 18/08/2028, Autor da mudança:
#       - Adicionando -s, -h & -v
#
# ----------------------------------------------------- #
# Agradecimento:
#
#   Samuel - Agradeço a mim mesmo pelo desempenho e dedicação.

# ------------------------------- VARIÁVEIS ----------------------------------------- #
CHAVE_DEBUG=0
NIVEL_DEBUG=0

ROXO="\033[35;1m"
VERDE="\033[32;1m"

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
Debugar () {
    [ $1 -le $NIVEL_DEBUG ] && echo -e "${2}Debug $* ------"
}

Soma() {
    local total=0

    for i in $(seq 1 25); do
        Debugar 1 "${ROXO}" "Entrei no for com o valor: $i"
        total=$(($total+$i))
        Debugar 2 "${VERDE}" "Depois da soma: $total"
    done

    echo "$total"
}

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

case "$1" in
  -d) [ $2 ] && NIVEL_DEBUG=$2 ;;
   *) Soma                     ;;
esac

Soma
# ------------------------------------------------------------------------ #
