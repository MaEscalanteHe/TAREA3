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

# Prompt de espera
MENSAJE_ENTER=$(echo -e "${bold}[Presiona enter para continuar]${NC}")

# Prompt de espera
MENSAJE_INICIAR=$(echo -e "${GREEN}[Presiona enter para iniciar el juego]${NC}")


####################################################################################################

### Dirs ###

# Dir
DIR=$(pwd)

echo 'sads'
echo $DIR

# Logos
ASCII=$DIR/ascii

# mactale.ascii
MACTALE_ASCII=$ASCII/mactale.ascii

# Retos dignidad.
RETOSDIGNIDAD_SH=$DIR/retosDignidad.sh

# Presentación.
PRESENTACION_SH=$DIR/presentacion.sh

# Oyente.
OYENTE_SH=$DIR/oyente.sh

# Última pelea.
ULTIMAPELEA_SH=$DIR/ultimaPelea.sh

# Revelación.
REVELACION_SH=$DIR/revelacion.sh

# Final
FINAL_SH=$DIR/final.sh

# Creditos.
CREDITOS_ASCII=$ASCII/creditos.ascii

####################################################################################################

### Funciones ###

# Función que se encarga de imprimir datos relevantes del script antes de comenzar con el juego.
function preInicio {
    clear
    echo -e "Hola preparador."
    echo -e ""
    echo -e "Te recomiendo que anotes estos datos:"
    echo -e "\t${bold}PID:${NC} ${GREEN}$PID ${NC}"
    echo -e "\t${bold}Hostname:${NC} ${GREEN}$(hostname) ${NC}"
    if [ $(whoami) == 'EAS' ]
    then
        echo -e "\t${bold}User:${NC} ${GREEN}$(whoami) ${NC} \t\t### ${bold}[Recuerda que debo estar ejecutandome bajo el user ${NC}${GREEN}EAS${NC}${bold}]${NC}"
    else
        echo -e "\t${bold}User:${NC} ${RED}$(whoami) ${NC} \t\t### ${bold}[Recuerda que debo estar ejecutandome bajo el user ${NC}${GREEN}EAS${NC}${bold}]${NC}"
    fi
    if [ -n "$TTY" ]
    then
        echo -e "\t${bold}TTY:${NC} ${GREEN}$TTY ${NC} \t\t### ${bold}[Asegurate de que la TTY indicada es donde está corriendo la interfaz gráfica]${NC}"
    else
        echo -e "\t${bold}TTY:${NC} ${RED}¡NO DEFINIDA! ${NC} \t\t### ${RED}[Si la TTY no está definida, no podrá hacer el chvt]${NC}"
    fi
    echo -e ""
    sleep 2
    read -p "$MENSAJE_ENTER"
    clear
}

# Función que se encarga de imprimir el logo del juego [MACTALE] en arte ascii.
function logoASCII {
    echo -e "$(cat $MACTALE_ASCII)" | pv -qL2222
    sleep 3
    echo -e "\n\n\t\t\t\t\t\t\t\t   ${YELLOW}[Ingresa el nombre de tu equipo]${NC}"
    echo -en "\n\n\t\t\t\t\t\t\t\t   "
    read -p "> " GROUPNAME
    echo -en "\n\n\t\t\t\t\t\t\t\t"
    sleep 2
    read -p "$MENSAJE_INICIAR"
}

# Función que se encarga de llamar al script que contiene los retos de dignidad de los usuarios.
function retosDignidad {
    source $RETOSDIGNIDAD_SH $TTY $GROUPNAME
}

# Función que se encarga de llamar al script que contiene la presentación de EAS.
function presentacion {
    source $PRESENTACION_SH $TTY $GROUPNAME
}

# Función que se encarga de llamar al script que contiene el oyente de las claves de los BOSSES.
function oyente {
    while true
    do
        source $OYENTE_SH $TTY $GROUPNAME
        if [ ! -f /tmp/N3oV1cE ]
        then
            continue
        else
            rm /tmp/.{magicant,laputa,konohagakure}
            rm /tmp/N3oV1cE
            break
        fi
    done
}

# Función que se encarga de llamar al script que contiene el oyente de la última clave del último BOSS.
function ultimaPelea {
    source $ULTIMAPELEA_SH $TTY $GROUPNAME
}

# Función que se encarga de llamar al script que contiene la revelación del Space Invader.
function revelacion {
    source $REVELACION_SH $TTY $GROUPNAME
}

# Función que se encarga de llamar al script que contiene la batalla con el Space Invader.
function final {
    source $FINAL_SH $TTY $GROUPNAME $PID
}

# Función que se encarga de mostrar los creditos.
function creditos {
    # echo -e "$(cat $CREDITOS_ASCII)" | pv -qL1000 | lolcat
    echo -e "${bold}$(cat $CREDITOS_ASCII)" | pv -qL1000
    sleep 20
    echo -e ""
    sleep 2
    read -p "$MENSAJE_ENTER"
    clear
}

####################################################################################################

### MAIN ###

# Usuario de los prenuevos
USER="Uc207Pr4f57t9"

# PID del proceso del script
PID=$$

# Llamadas a todas las funciones
preInicio
logoASCII
retosDignidad
presentacion
oyente
ultimaPelea
revelacion
final
creditos