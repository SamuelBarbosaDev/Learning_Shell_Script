#!/usr/bin/bash
#
# 1_extração_de_dados.sh - Breve descrição
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
#   $ ./1_extração_de_dados.sh -d 1
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
ARQUIVO_DA_RASPAGEM="raspagem_de_dados.txt"
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

# ------------------------------------------------------------------------ #

# ------------------------------- TESTES ----------------------------------------- #
# Lynx instalado?
[ ! -x "$(which lynx)" ] && sudo apt install lynx -y
# ------------------------------------------------------------------------ #

# ------------------------------- FUNÇÕES ----------------------------------------- #

# ------------------------------------------------------------------------ #

# ------------------------------- EXECUÇÃO ----------------------------------------- #
lynx -source https://www.gnu.org/software/bash/manual/bash.html#Conditional-Constructs | \
grep '<h3 class="section">' | \
sed 's/<span.*class="section">//;s/<\/h3>//' > raspagem_de_dados.txt

while read -r raspagem; do
    echo -e "${VERMELHO}Titulo: ${VERDE}$raspagem"
done < "$ARQUIVO_DA_RASPAGEM"
# ------------------------------------------------------------------------ #
