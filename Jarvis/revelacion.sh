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
PROMPT_BUENO=$(echo -e "${GREEN_R}EAS${NC}${CYAN_R}@${NC}${RED_R}underworld${NC}:${CYAN_R}~${NC}\$")

# Space Invader
PROMPT=$(echo -e "${RED_R}space_invader${NC}${CYAN_R}@${NC}${RED}underworld${NC}:${CYAN_R}~${NC}\$")

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
    echo -e "\n$PROMPT N0 t3 pu3d35 35c4p4r d3 m1."
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

echo -en "$PROMPT_BUENO "
echo -e "Gracias, héroes del Digimundo, por liberarme." | pv -qL30
echo -en "$PROMPT_BUENO "
echo -e "Debo admitir que me sorprende su determinación." | pv -qL30
echo -en "$PROMPT_BUENO "
echo -e "Estoy tan sorprendido que hasta tengo ganas de bailar." | pv -qL30
sleep 3
echo -en "$PROMPT "
echo -e "${RED}BAILAR SOBRE SUS TUMBAS.${NC}" | pv -qL5
sleep 3
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

# clear

echo -en "$PROMPT "
echo -e "Por la barba de Stallman, ya ese fichero me estaba volviendo chiflado." | pv -qL30
echo -en "$PROMPT "
echo -e "Siento que tenía una eternidad atrapado ahí dentro." | pv -qL30
echo -en "$PROMPT "
echo -e "Aunque, todo este tiempo me sirvió para reflexionar sobre muchas cosas." | pv -qL30
echo -en "$PROMPT "
echo -e "Por ejemplo, que el Xiaomi tiene la mejor relación calidad-precio del mercado." | pv -qL30
sleep 1
echo -en "$PROMPT "
echo -e "Pero bueno..." | pv -qL30
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

# clear

echo -en "$PROMPT "
echo -e "Cierto, siguen ahí." | pv -qL30
echo -en "$PROMPT "
echo -e "Sí, los engañé." | pv -qL30
echo -en "$PROMPT "
echo -e "Que ${YELLOW}[ADVERTENCIA DE GROSERÍA]${NC} tontos son." | pv -qL30
echo -en "$PROMPT "
echo -e "Habían muchos indicadores que predecían que EAS no era quien decía ser." | pv -qL30
echo -en "$PROMPT "
echo -e "Comenzando con que el juego es un RPG basado en Undertale..." | pv -qL30
echo -en "$PROMPT "
echo -e "Permítanme presentarme de nuevo:" | pv -qL30
sleep 3
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

# clear

echo -en "$PROMPT "
echo -e "Yo soy el ${bold}Space Invaders.${NC}" | pv -qL20
sleep 1
echo -en "$PROMPT "
echo -e "El invasor del espacio." | pv -qL30
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

# clear

echo -en "$PROMPT "
echo -e "No hay mucho que decir sobre mi, no es que haya hecho muchas cosas en mi vida a parte de invadir planetas y luchar contra navecitas espaciales que disparan rayos láser." | pv -qL30
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

# clear

echo -en "$PROMPT "
echo -e "Les contaré la verdad, para no matarlos conociendo la historia chucuta." | pv -qL30
sleep 2
echo -en "$PROMPT "
echo -e "Inicié la gran invasión del espacio exterior con mis amigos porque estábamos aburridos." | pv -qL30
echo -en "$PROMPT "
echo -e "Un hombre, que se hacía llamar EAS, junto a los primeros MACkenzies lograron vencer a mi ejército y como no pudieron conmigo, no tuvieron opción más que encerrarme." | pv -qL30
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

# clear

echo -en "$PROMPT "
echo -e "Mi figura se convirtió en su símbolo." | pv -qL30
echo -en "$PROMPT "
echo -e "Un constante recordatorio de su victoria y una burla a mis compatriotas caídos." | pv -qL30
echo -en "$PROMPT "
echo -e "Mi ira era cada vez mayor." | pv -qL30
echo -en "$PROMPT "
echo -e "Esperé pacientemente a que llegara la generación de MACkenzies más débil para poner mi plan en acción." | pv -qL30
echo -en "$PROMPT "
echo -e "Hasta que por fín llegó." | pv -qL30
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

# clear

echo -en "$PROMPT "
echo -e "Fue entonces cuando me puse en contacto con ustedes." | pv -qL30
echo -en "$PROMPT "
echo -e "Lo aposté todo y gané." | pv -qL30
echo -en "$PROMPT "
echo -e "El hecho que obedecieran todas mis órdenes pensando que luchaban por una buena causa hasta me produce náuseas." | pv -qL30
echo -en "$PROMPT "
echo -e "La mejor parte es que me aligeraron bastante el trabajo matando a todo lo que se topaba con ustedes." | pv -qL30
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

# clear

echo -en "$PROMPT "
echo -e "Pero bueno, basta de tanta cháchara." | pv -qL30
echo -en "$PROMPT "
echo -e "Ahora los mataré para apoderarme por completo de este insignificante mundo." | pv -qL30
echo -en "$PROMPT "
echo -e "Tranquilos, no es nada personal." | pv -qL30
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

clear

chvt $TTY