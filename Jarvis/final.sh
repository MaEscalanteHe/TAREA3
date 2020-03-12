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

PID=$3

####################################################################################################

### Mensajes Reutilizables ###

# Space Invader
PROMPT=$(echo -e "${RED_R}space_invader${NC}${CYAN_R}@${NC}${RED}underworld${NC}:${CYAN_R}~${NC}\$")

# Prompt del prenuevo con rot13, para simular que está bug el prompt.
PROMPT_PRENUEVO=$(echo -e "${BLUE_R}${GROUPNAME}${NC}${CYAN_R}@${NC}${YELLOW_R}MAC${NC}:${CYAN_R}~${NC}\$")

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
    echo -e "\n$PROMPT ${RED}N0 t3 pu3d35 35c4p4r d3 m1.${NC}"
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

# Trapeamos las señales del sistema.
trapear

clear

#setsid mplayer tracks/final.mp3 > /dev/null 2> /dev/null &

echo -en "$PROMPT "
echo -e "${bold}¡¿3N53R10 P13N54N QU3 9U3D3N C0NTR4 M1?!${NC}" | pv -qL10
echo -en "$PROMPT "
echo -e "${bold}L0 PAG4R4N CAR0.${NC}" | pv -qL10
echo -en "$PROMPT "
echo -e "${bold}YO 4H0R4 T3NG0 3L CONTR0L DEL D1G1T4L W0RLD.${NC}" | pv -qL10
echo -en "$PROMPT "
echo -e "${bold}¡N0 P0DR4N H4C3R N4D4! J4J4J4J4J4J4${NC}" | pv -qL10
sleep 5
echo -e ""
echo -e "${YELLOW}[Destruye al${NC} ${RED}Space Invader${NC} ${YELLOW}lo más rápido posible]${NC}"
echo -e ""
sleep 2
while true
do
    echo -en "$PROMPT_PRENUEVO "
    read SIGNAL
    if [ "$SIGNAL" == "instakill" ]
    then
        kill -9 $PID
    fi
done

clear
