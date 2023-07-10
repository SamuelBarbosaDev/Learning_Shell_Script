#!/usr/bin/bash
#
# 1_arquivo_de_configuração.sh - Breve descrição
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
#   $ ./1_arquivo_de_configuração.sh -d 1
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
ARQUIVO_DE_CONFIGURACAO='configuração.cf'
USAR_CORES=
USAR_MAIUSCULOS=
MENSAGEM='Mensagem De Teste'
VERDE="\033[32;1m"
VERMELHO='\033[31;1m'
# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
[ ! -r "$ARQUIVO_DE_CONFIGURACAO" ] && echo 'Não Termos acesso de leitura' && exit 1
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #
DefinirParametros () {
    local parametro="$(echo $1 | cut -d = -f 1)"
    local valor="$(echo $1 | cut -d = -f 2)"

    case  "$parametro" in
        USAR_CORES) USAR_CORES="$valor"           ;;
        USAR_MAIUSCULOS) USAR_MAIUSCULOS="$valor" ;;
    esac
}

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
while read -r linha; do
    [ "$(echo $linha | cut -c1)" = '#' ] && continue
    [ ! $linha ] && continue
    DefinirParametros "$linha"
done < "$ARQUIVO_DE_CONFIGURACAO"

[ "$USAR_MAIUSCULOS" = '1' ] && MENSAGEM="$(echo -e $MENSAGEM | tr [a-z] [A-Z])"
[ "$USAR_CORES" = '1' ] && MENSAGEM="$(echo -e ${VERDE}$MENSAGEM)"
echo "$MENSAGEM"



# ------------------------------------------------------------------------ #
