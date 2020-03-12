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
PROMPT=$(echo -e "${GREEN_R}EAS${NC}${CYAN_R}@${NC}${RED_R}haqrejbeyq${NC}:${CYAN_R}~${NC}\$")

# Prompt del prenuevo con rot13, para simular que está bug el prompt.
PROMPT_PRENUEVO_BUG=$(echo -e "${BLUE_R}${GROUPNAME}${NC}${CYAN_R}@${NC}${RED_R}haqrejbeyq${NC}:${CYAN_R}~${NC}\$")

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
    echo -e "\n$PROMPT No me puedes salir chico, debes probar tu valentía."
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

# Función que se encarga del primer reto.
function primerReto {
    DIGIMUNDO="El mundo virtual"
    ANSWER='-1'
    echo -en "$PROMPT "
    echo -e "¿Cuál es el valor de la variable DIGIMUNDO?" | pv -qL20
    # Eliminamos el directorio de dENV_reto1 en caso de que exista.
    if [ -d "dENV_reto1" ]
    then
        rm -rf dENV_reto1
    fi
    # Creamos el directorio de dENV_reto1.
    mkdir dENV_reto1
    # Nos movemos dentro del directorio.
    cd dENV_reto1
    # Creamos varios archivos dentro de ese directorio.
    touch {.,a,b,c}{1,2,3,4}{MAC,GIA,DELU}
    while [ "$RESULT" != "$ANSWER" ]
    do
        echo -en "$PROMPT_PRENUEVO_BUG "
        read COMMAND
        COMMAND=$COMMAND" 2> /dev/null"
        # Evalua el input del usuario.
        eval RESULT=\`${COMMAND}\`
        # Respuesta correcta.
        ANSWER=`echo $DIGIMUNDO`
        if [ "$RESULT" != "$ANSWER" ]
        then
            echo -en "$PROMPT "
            echo -e "${RED}Incorrecto.${NC}" | pv -qL20
        fi
    done
    cd ..
    rm -rf dENV_reto1
    echo -en "$PROMPT "
    echo -e "${GREEN}Correcto.${NC}" | pv -qL20
}

# Función que se encarga del segundo reto.
function segundoReto {
    ANSWER1='-1'
    ANSWER2='-1'
    echo -en "$PROMPT "
    echo -e "¿Cuantas lineas tiene el archivo .MAC?" | pv -qL20
    # Eliminamos el directorio de dENV_reto2 en caso de que exista.
    if [ -d "dENV_reto2" ]
    then
        rm -rf dENV_reto2
    fi
    # Creamos el directorio de dENV_reto2.
    mkdir dENV_reto2
    # Nos movemos dentro del directorio.
    cd dENV_reto2
    # Creamos varios archivos dentro de ese directorio.
    touch {.,a,b,c}{1,2,3,4}{MAC,GIA,DELU}
    # Creamos el archivo .MAC con su correspondiente contenido.
    echo -e "La\nmejor\nagrupacion\nde\ntodas." > .MAC
    while [[ "$RESULT" != "$ANSWER1" && "$RESULT" != "$ANSWER2" ]]
    do
        echo -en "$PROMPT_PRENUEVO_BUG "
        read COMMAND
        COMMAND=$COMMAND" 2> /dev/null"
        # Evalua el input del usuario.
        eval RESULT=\`${COMMAND}\`
        # Respuestas correctas.
        ANSWER1=`wc -l .MAC`
        ANSWER2=`cat .MAC | wc -l`
        if [[ "$RESULT" != "$ANSWER1" && "$RESULT" != "$ANSWER2" ]]
        then
            echo -en "$PROMPT "
            echo -e "${RED}Incorrecto.${NC}" | pv -qL20
        fi
    done
    cd ..
    rm -rf dENV_reto2
    echo -en "$PROMPT "
    echo -e "${GREEN}Correcto.${NC}" | pv -qL20
}

# Función que se encarga del tercer reto.
function tercerReto {
    ANSWER='-1'
    echo -en "$PROMPT "
    echo -e "Liste detalladamente los archivos, incluyendo los ocultos." | pv -qL20
    # Eliminamos el directorio de dENV_reto3 en caso de que exista.
    if [ -d "dENV_reto3" ]
    then
        rm -rf dENV_reto3
    fi
    # Creamos el directorio de dENV_reto3.
    mkdir dENV_reto3
    # Nos movemos dentro del directorio.
    cd dENV_reto3
    # Creamos varios archivos dentro de ese directorio.
    touch {.,a,b,c}{1,2,3,4}{MAC,GIA,DELU}
    while [ "$RESULT" != "$ANSWER" ]
    do
        echo -en "$PROMPT_PRENUEVO_BUG "
        read COMMAND
        COMMAND=$COMMAND" 2> /dev/null"
        # Evalua el input del usuario.
        eval RESULT=\`${COMMAND}\`
        # Respuesta correcta.
        ANSWER=`ls -la`
        if [ "$RESULT" != "$ANSWER" ]
        then
            echo -en "$PROMPT "
            echo -e "${RED}Incorrecto.${NC}" | pv -qL20
        fi
    done
    cd ..
    rm -rf dENV_reto3
    echo -en "$PROMPT "
    echo -e "${GREEN}Correcto.${NC}" | pv -qL20
}

####################################################################################################

### MAIN ###

# Trapeamos las señales del sistema.
trapear

clear

echo -en "$PROMPT "
echo -e "¿Están preparados?" | pv -qL10
sleep 0.5
while true
do
    echo -en "$PROMPT_PRENUEVO_BUG "
    read re
    if [[ $re == 'si' || $re == 'SI' || $re == 'Si' || $re == 'sí' || $re == 'Sí' || $re == 'Sí' ]]
    then
        echo -en "$PROMPT "
        echo -e "Perfecto, así que son prenuevos con valor..." | pv -qL15
        break
    elif [[ $re == 'no' || $re == 'NO' || $re == 'No' ]]
    then
        echo -en "$PROMPT "
        echo -e "Vaya... Me lo esperaba." | pv -qL10
        sleep 1
        echo -en "$PROMPT "
        echo -e "Si no están preparados, entonces preparense para la violación." | pv -qL15
        break
    else
        echo -en "$PROMPT "
        echo -e "Vamos, no es tán díficil decirme un ${bold}'Sí'${NC} o un ${bold}'No'${NC}." | pv -qL15
        continue
    fi
done
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"

clear

echo -en "$PROMPT "
echo -e "Necesito saber que son dignos de la aventura que se aproxima." | pv -qL30
echo -en "$PROMPT "
echo -e "Por lo tanto, necesito que resuelvan tres ${bold}(3)${NC} simples retos." | pv -qL30
sleep 1
echo -e ""
read -p "$MENSAJE_ENTER"

clear

# Llamamos la función del primer reto.
primerReto
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"

clear

# Llamamos la función del segundo reto.
segundoReto
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"

clear

# Llamamos la función del tercer reto.
tercerReto
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"

clear
