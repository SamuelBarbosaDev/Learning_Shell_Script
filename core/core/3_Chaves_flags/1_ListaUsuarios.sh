#!/usr/bin/bash
#
# ListaUsuarios.sh - Extrai usuários do /etc/passwd
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
#   $ ./ListaUsuarios.sh -s -m
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

USUARIOS="$(cat /etc/passwd | cut -d : -f 1)"
MENSAGEM_USUARIO="
    $(basename $0) - [OPÇÕES]

        -h - Menu de ajuda
        -v - Versão
        -s - Ordenar a saída
        -m - Torna a saída maiuscula
"
VERSION="v1.0"
CHAVE_ORDENADA=0
CHAVE_MAIUSCULA=0

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while test -n "$1"; do
    case "$1" in
        -h) echo "$MENSAGEM_USUARIO" && exit 0             ;;
        -v) echo "$VERSION" && exit 0                      ;;
        -s) CHAVE_ORDENADA=1                               ;;
        -m) CHAVE_MAIUSCULA=1                              ;;
        *)  echo "Opção inválida, avalie o - h"  && exit 0 ;;
    esac
    shift 
done

[ $CHAVE_ORDENADA -eq 1 ]  && USUARIOS=$(echo "$USUARIOS" | sort)
[ $CHAVE_MAIUSCULA -eq 1 ] && USUARIOS=$(echo "$USUARIOS" | tr [a-z] [A-Z])

echo "$USUARIOS"
# ------------------------------------------------------------------------ #
