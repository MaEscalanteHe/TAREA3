#!/bin/bash

### Colors ###

# Regular
BLACK_R='\e[0;30m' # Black
RED_R='\e[0;31m' # Red
GREEN_R='\e[0;32m' # Green
YELLOW_R='\e[0;33m' # Yellow
BLUE_R='\e[0;34m' # Blue
PURPLE_R='\e[0;35m' # Purple
CYAN_R='\e[0;36m' # Cyan
WHITE_R='\e[0;37m' # White

# Bold
BLACK='\e[1;30m' # Black
RED='\e[1;31m' # Red
GREEN='\e[1;32m' # Green
YELLOW='\e[1;33m' # Yellow
BLUE='\e[1;34m' # Blue
PURPLE='\e[1;35m' # Purple
CYAN='\e[1;36m' # Cyan
WHITE='\e[1;37m' # White

# Underline
BLACK_U='\e[4;30m' # Black
RED_U='\e[4;31m' # Red
GREEN_U='\e[4;32m' # Green
YELLOW_U='\e[4;33m' # Yellow
BLUE_U='\e[4;34m' # Blue
PURPLE_U='\e[4;35m' # Purple
CYAN_U='\e[4;36m' # Cyan
WHITE_U='\e[4;37m' # White

# Background
BLACK_BACK='\e[40m'   # Black
RED_BACK='\e[41m'   # Red
GREEN_BACK='\e[42m'   # Green
YELLOW_BACK='\e[43m'   # Yellow
BLUE_BACK='\e[44m'   # Blue
PURPLE_BACK='\e[45m'   # Purple
CYAN_BACK='\e[46m'   # Cyan
WITHE_BACK='\e[47m'   # White

# Others
NC='\033[0m' # No Color
bold='\033[1m' # Bold

####################################################################################################

### Herencia ###

TTY=$1

GROUPNAME=$2

####################################################################################################

### Mensajes Reutilizables ###

# EAS
PROMPT=$(echo -e "${GREEN_R}EAS${NC}${CYAN_R}@${NC}${RED_R}underworld${NC}:${CYAN_R}~${NC}\$")

# Prompt del prenuevo con rot13, para simular que está bug el prompt.
PROMPT_PRENUEVO_BUG=$(echo -e "${BLUE_R}${GROUPNAME}${NC}${CYAN_R}@${NC}${RED_R}underworld${NC}:${CYAN_R}~${NC}\$")

# Prompt de espera
MENSAJE_ENTER=$(echo -e "${bold}[Presiona enter para continuar]${NC}")

# Prompt de espera
MENSAJE_INICIAR=$(echo -e "${GREEN}[Presiona enter para iniciar el juego]${NC}")


####################################################################################################

### Dirs ###

# Dir
DIR=$(pwd)

# Logos
ASCII=$DIR/ascii

####################################################################################################

### Funciones ###

# Función que muestra mensaje si la persona intenta salir del script en algún momento.
function youCANTexit {
    echo -e "\n$PROMPT No me puedes salir chico, todavía me debes algunos códigos."
}

# Función que trapea todas las señales para evitar que el usuario salga del script.
function trapear {
    trap youCANTexit SIGHUP
    trap youCANTexit SIGINT
    trap youCANTexit SIGQUIT
    trap youCANTexit SIGILL
    trap youCANTexit SIGTRAP
    trap youCANTexit SIGABRT
    trap youCANTexit SIGBUS
    trap youCANTexit SIGFPE
    trap youCANTexit SIGUSR1
    trap youCANTexit SIGSEGV
    trap youCANTexit SIGUSR2
    trap youCANTexit SIGPIPE
    trap youCANTexit SIGALRM
    trap youCANTexit SIGTERM
    trap youCANTexit SIGSTOP
    trap youCANTexit SIGTSTP
}

####################################################################################################

### MAIN ###

# Usuario de los prenuevos
USER="Uc207Pr4f57t9"

# PATH mundos.
PATH_MAGICANT=/home/$USER/Digimundo/Magicant
PATH_LAPUTA=/home/$USER/Digimundo/LaPuta
PATH_KONOHAGAKURE=/home/$USER/Digimundo/Konohagakure
PATH_NEOVICE=/home/$USER/Digimundo/NeoVice

# Códigos que te dan los MACFighters.
CODE_MAGICANT="Abada kedabra"
CODE_LAPUTA="La Puta sera mia"
CODE_KONOHAGAKURE="Yo sere hokage"
CODE_NEOVICE="Kernel Panic"

# Trapeamos las señales del sistema.
trapear

clear

echo -en "$PROMPT "
echo -e "Si necesitas llamarme para darme un código de un mundo, ejecuta ${bold}'Zumbido'${NC}" | pv -qL30
sleep 1
while [[ "$COMMAND" != "Zumbido" && "$COMMAND" != "zumbido" && "$COMMAND" != "ZUMBIDO" ]]
do
    echo -en "$PROMPT_PRENUEVO_BUG "
    read COMMAND
done
COMMAND=""

clear

echo -en "$PROMPT "
echo -e "${bold}¡¿Conseguiste derrotar a un MACFighter?!${NC} Si es asi, dame el código del mundo que decidiste desbloquear:" | pv -qL30
sleep 0.5
echo -en "$PROMPT_PRENUEVO_BUG "
read CODE
if [[ "$CODE" != "$CODE_MAGICANT" && "$CODE" != "$CODE_LAPUTA" && "$CODE" != "$CODE_KONOHAGAKURE" && "$CODE" != "$CODE_NEOVICE" ]]
then
    echo -en "$PROMPT "
    echo -e "Ese código no corresponde a ninguna zona..." | pv -qL30
    echo -en "$PROMPT "
    echo -e "Eviten en lo posible llamarme, eso drena mi energia y me queda muy poca." | pv -qL30
    sleep 5
elif [ "$CODE" == "$CODE_MAGICANT" ] && [ ! -f /tmp/.magicant ]
then
    echo -en "$PROMPT "
    echo -e "¡Excelente!" | pv -qL30
    echo -en "$PROMPT "
    echo -e "Ya desbloquee el mundo ${bold}'Magicant'${NC}." | pv -qL30
    echo -en "$PROMPT "
    echo -e "Tengan mucho cuidado, los magos en ese lugar pueden llegar a ser muy poderosos, no se confien." | pv -qL30
    # Da permisos de ejecución a la carpeta de Magicant (Así los usuarios pueden acceder a ella.)
    chown -R $USER:$USER $PATH_MAGICANT
    # Creamos el archivo .magicant para que se pueda verificar que ya se tiene acceso a ese mapa de directorios.
    echo -e "Se le habilita el paso a Magicant a los prenuevos." > /tmp/.magicant
    echo -e ""
    sleep 2
    read -p "$MENSAJE_ENTER"
elif [ "$CODE" == "$CODE_MAGICANT" ] && [ -f /tmp/.magicant ]
then
    echo -en "$PROMPT "
    echo -e "Magicant ya fue desbloqueado..." | pv -qL30
    echo -en "$PROMPT "
    echo -e "¿No me estan tomando el pelo verdad?" | pv -qL30
    echo -en "$PROMPT "
    echo -e "Llamame solo cuando sea completamente necesario." | pv -qL30
    sleep 5
elif [ "$CODE" == "$CODE_LAPUTA" ] && [ ! -f /tmp/.laputa ]
then
    echo -en "$PROMPT "
    echo -e "¡Maravilloso!" | pv -qL30
    echo -en "$PROMPT "
    echo -e "Estoy muy sorprendido." | pv -qL30
    echo -en "$PROMPT "
    echo -e "Ya esta disponible el mundo ${bold}'LaPuta'${NC}." | pv -qL30
    echo -en "$PROMPT "
    echo -e "Es uno de mis mundos favoritos, tristemente cayó en manos del maldito JO." | pv -qL30
    # Da permisos de ejecución a la carpeta de LaPuta (Así los usuarios pueden acceder a ella.)
    chown -R $USER:$USER $PATH_LAPUTA
    # Creamos el archivo .laputa para que se pueda verificar que ya se tiene acceso a ese mapa de directorios.
    echo -e "Se le habilita el paso a LaPuta a los prenuevos." > /tmp/.laputa
    echo -e ""
    sleep 2
    read -p "$MENSAJE_ENTER"
elif [ "$CODE" == "$CODE_LAPUTA" ] && [ -f /tmp/.laputa ]
then
    echo -en "$PROMPT "
    echo -e "LaPuta ya fue desbloqueado..." | pv -qL30
    echo -en "$PROMPT "
    echo -e "¿No me estan tomando el pelo verdad?" | pv -qL30
    echo -en "$PROMPT "
    echo -e "Llamame solo cuando sea completamente necesario." | pv -qL30
    sleep 5
elif [ "$CODE" == "$CODE_KONOHAGAKURE" ] && [ ! -f /tmp/.konohagakure ]
then
    echo -en "$PROMPT "
    echo -e "¡Fantástico!" | pv -qL30
    echo -en "$PROMPT "
    echo -e "La aldea ${bold}'Konohagakure'${NC} ya no se encuentra oculta para ustedes." | pv -qL30
    echo -en "$PROMPT "
    echo -e "Admito que cuando cree ese mundo acababa de ver cierto anime." | pv -qL30
    echo -en "$PROMPT "
    echo -e "Esten alertas, los monstruos ahi son implacables." | pv -qL30
    # Da permisos de ejecución a la carpeta de Konohagakure (Así los usuarios pueden acceder a ella.)
    chown -R $USER:$USER $PATH_KONOHAGAKURE
    # Creamos el archivo .konohagakure para que se pueda verificar que ya se tiene acceso a ese mapa de directorios.
    echo -e "Se le habilita el paso a Konohagakure a los prenuevos." > /tmp/.konohagakure
    echo -e ""
    sleep 2
    read -p "$MENSAJE_ENTER"
elif [ "$CODE" == "$CODE_KONOHAGAKURE" ] && [ -f /tmp/.konohagakure ]
then
    echo -en "$PROMPT "
    echo -e "Konoha ya fue desbloqueado..." | pv -qL30
    echo -en "$PROMPT "
    echo -e "¿No me estan tomando el pelo verdad?" | pv -qL30
    echo -en "$PROMPT "
    echo -e "Llamame solo cuando sea completamente necesario." | pv -qL30
    sleep 5
elif [ "$CODE" == "$CODE_NEOVICE" ] && [ ! -f /tmp/N3oV1cE ]
then
    echo -en "$PROMPT "
    echo -e "${bold}¡......M...u...b...e...n... ya pued...o...c...municarme ...on...ustedes otr...a vez!${NC}" | pv -qL20
    sleep 1
    echo -en "$PROMPT "
    echo -e "¡Han hecho un tr...b...jo formidable!" | pv -qL20
    echo -en "$PROMPT "
    echo -e "Pero aún d..ben venir hasta acá, para sacarme d...${bold}La SIGST...GRIAL${NC}." | pv -qL20
    echo -en "$PROMPT "
    echo -e "Ya... no pod..re ... com..carme con ...des." | pv -qL20
    echo -en "$PROMPT "
    echo -e "¡Solo un poc...más y tend...án su mer...cida recomp...nsa!" | pv -qL20
    # Da permisos de ejecución a la carpeta de Konohagakure (Así los usuarios pueden acceder a ella.)
    chown -R $USER:$USER $PATH_NEOVICE
    # Creamos el archivo N3oV1cE para que se pueda verificar la condición del final.
    echo -e "MALDITOS PRENUEVOS NO SE MERECEN ESTA VAINA." > /tmp/N3oV1cE
    echo -e ""
    sleep 2
    read -p "$MENSAJE_ENTER"
else
    echo -en "$PROMPT "
    echo -e "Ese código no corresponde a ninguna zona..." | pv -qL30
    echo -en "$PROMPT "
    echo -e "Eviten en lo posible llamarme, eso drena mi energia y me queda muy poca." | pv -qL30
    sleep 5
fi

clear