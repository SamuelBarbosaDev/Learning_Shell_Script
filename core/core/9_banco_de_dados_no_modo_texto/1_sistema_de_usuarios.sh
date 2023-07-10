#!/usr/bin/bash
#
# boas_práticas.sh - Breve descrição
# 
# Site:         https://github.com/SamuelBarbosaDev/
# Autor:        Samuel Barbosa
# Manutenção:   1.1.1
#
#
# ----------------------------------------------------- #
# Aqui você deve utilizar uma descrição mais detalhada
# sobre o seu programa, explicando a forma de utilizar
# 
# Exemplo:
#   $ ./boas_práticas.sh -d 1
#   Neste exemplo o script será executado no modo debug
#   nível 1.
# ----------------------------------------------------- #
# Histórico:
#
#   v1.0 18/08/2028, Autor da mudança:
#       - O que mudou?
#   v1.1 19/08//2018, Autor da mudança:
#       - O que mudou:
# ----------------------------------------------------- #
# Agradecimento:
#
#   Samuel - Encontou um bug na parte de login.
#   colaborador 1 - Enviou uma sugestão de adicionar 
#   o -h.

# ------------------------------- VARIÁVEIS ----------------------------------------- #
ARQUIVO_DE_BANCO_DE_DADOS='banco_de_dados.txt'
SEP=:
TEMP=temp.$$
MENSAGEM='Mensagem De Teste'
VERDE="\033[32;1m"
VERMELHO='\033[31;1m'
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -e "$ARQUIVO_DE_BANCO_DE_DADOS" ] && echo 'ERRO. Arquivo não existe.' && exit 1
[ ! -r "$ARQUIVO_DE_BANCO_DE_DADOS" ] && echo 'ERRO. Arquivo não tem permissão de leitura.' && exit 1
[ ! -w "$ARQUIVO_DE_BANCO_DE_DADOS" ] && echo 'ERRO. Arquivo não tem permissão de escrita.' && exit 1


# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
MostraUsuariosNaTela () {
    local id="$(echo $1 | cut -d $SEP -f 1)"
    local nome="$(echo $1 | cut -d $SEP -f 2)"
    local email="$(echo $1 | cut -d $SEP -f 3)"
    echo -e "${VERDE}Id: ${VERMELHO}$id"
    echo -e "${VERDE}Nome: ${VERMELHO}$nome"
    echo -e "${VERDE}Email: ${VERMELHO}$email"
}

ListaUsuarios () {
    while read -r linha; do
        [ "$(echo $linha | cut -c1)" = '#' ] && continue
        [ ! $linha ] && continue
        MostraUsuariosNaTela "$linha"
    done < "$ARQUIVO_DE_BANCO_DE_DADOS"
}

ValidaExistenciaUsuario () {
    grep -i -q "$1$SEP" "$ARQUIVO_DE_BANCO_DE_DADOS"
}

InseriUsuario () {
    local nome="$(echo $1 | cut -d $SEP -f 2)"
    
    if ValidaExistenciaUsuario "$nome"; then
        echo "ERRO. Usuário já existe." && exit 1
    else
        echo "$*" >> "$ARQUIVO_DE_BANCO_DE_DADOS"
        echo "Usuário cadastrado com sucesso."
    fi 

    OrdenaLista
}

ApagaUsuario () {
    ValidaExistenciaUsuario "$1" || return

    grep -i -v "$1$SEP" "$ARQUIVO_DE_BANCO_DE_DADOS" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_DE_BANCO_DE_DADOS"

    echo "Usuário apagado."

    OrdenaLista
}

OrdenaLista () {
    sort "$ARQUIVO_DE_BANCO_DE_DADOS" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_DE_BANCO_DE_DADOS"
}
# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #

# ------------------------------------------------------------------------ #