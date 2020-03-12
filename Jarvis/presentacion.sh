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

# Unknow
PROMPT_BUG=$(echo -e "${GREEN_R}EAS${NC}${CYAN_R}@${NC}${RED_R}haqrejbeyq${NC}:${CYAN_R}~${NC}\$")

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

# caballero.ascii
CABALLERO_ASCII=$ASCII/caballero.ascii

# maga.ascii
MAGA_ASCII=$ASCII/maga.ascii

# Uganda
UGANDA_ASCII=$ASCII/uganda.ascii

####################################################################################################

### Funciones ###

# Función que muestra mensaje si la persona intenta salir del script en algún momento.
function youCANTexit {
    echo -e "\n$PROMPT No me puedes salir chico, no me puedes dejar solo."
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

echo -en "$PROMPT_BUG "
echo -e "¡Excelente!" | pv -qL30
echo -en "$PROMPT_BUG "
echo -e "No me equivoque al traerlos aqui." | pv -qL30
echo -en "$PROMPT_BUG "
echo -e "Bienvenidos al Digimundo, héroes virtuales." | pv -qL30
echo -en "$PROMPT_BUG "
echo -e "Ahora se encuentran en la mágica dimensión de las estructuras de control y los strings arbitrarios." | pv -qL30
echo -en "$PROMPT_BUG "
echo -e "Pero no todo es tan bueno como parece." | pv -qL30
echo -en "$PROMPT_BUG "
echo -e "Primero, permítanme presentarme:" | pv -qL30
sleep 3
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

clear
echo -e "${bold}$(cat $UGANDA_ASCII)${NC}" | pv -qL2222
sleep 0.5

echo -en "$PROMPT "
echo -e "Yo soy EAS, amo y señor de estas tierras." | pv -qL30
echo -en "$PROMPT "
echo -e "Eterno comandante de legiones." | pv -qL30
echo -en "$PROMPT "
echo -e "Gran maestro de las artes de programación." | pv -qL30
echo -en "$PROMPT "
echo -e "Y todo lo que sigue de mi currículo..." | pv -qL30
# sleep 2
# echo -e ""
# read -p "$MENSAJE_ENTER"
# echo -e ""

# # clear


echo -en "$PROMPT "
echo -e "Mi fama me precede." | pv -qL30
echo -en "$PROMPT "
echo -e "Fui yo quien desarrolló y compiló este mundo y mató al proceso conocido como la ${bold}'gran invasión del espacio exterior'${NC}" | pv -qL30
echo -en "$PROMPT "
echo -e "La vez que casi fuimos aniquilados por extraterrestres que venían con ganas de pasarla bien." | pv -qL30
# sleep 2
# echo -e ""
# read -p "$MENSAJE_ENTER"
# echo -e ""

# # clear

echo -en "$PROMPT "
echo -e "También fundé algo de lo que hoy me arrepiento, la civilización MACkenzie." | pv -qL30
echo -en "$PROMPT "
echo -e "Un grupo de jóvenes tarados que no hacen nada bien." | pv -qL30
# sleep 2
# echo -e ""
# read -p "$MENSAJE_ENTER"
# echo -e ""

# # clear

echo -en "$PROMPT "
echo -e "Aún por todo lo que hice, mis malagradecidos subordinados decidieron capturarme en un script, invocando una función que atrapa a la señal más poderosa de todas: ${bold}La SIGSTARGRIAL.${NC}" | pv -qL30
echo -en "$PROMPT "
echo -e "El mal que se apoderó de sus corazones ahora reina en nuestro mundo." | pv -qL30
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

clear
echo -e "${bold}$(cat $UGANDA_ASCII)${NC}"
sleep 0.5

echo -en "$PROMPT "
echo -e "Usé las pocas energías que me quedaban para traerlos aquí y ahora les pido que me liberen." | pv -qL30
echo -en "$PROMPT "
echo -e "Pero para cumplir esa tarea, primero deben neutralizar a los MACkenzies más fuertes, ${bold}Los MACfighters${NC}, quienes custodian cuatro regiones de este mundo." | pv -qL30
echo -en "$PROMPT "
echo -e "Consideren que el acceso a algunas regiones está condicionado." | pv -qL30
echo -en "$PROMPT "
echo -e "Cuando acaben con los MACfighters, el camino hacia mi ubicación secreta será revelado." | pv -qL30
# sleep 2
# echo -e ""
# read -p "$MENSAJE_ENTER"
# echo -e ""

# # clear

echo -en "$PROMPT "
echo -e "Confío en sus habilidades de ${bold}GNU/LINUX${NC} para defenderse de los peligros que habitan estas tierras." | pv -qL30
echo -en "$PROMPT "
echo -e "También les conferiré cuerpos más fuertes y resistentes para equilibrar las cosas." | pv -qL30
echo -en "$PROMPT "
echo -e "Sus avatares serán:" | pv -qL30
sleep 2
echo -e "$BLUE$(cat $CABALLERO_ASCII)$NC" | pv -qL2222
echo -en "$PROMPT "
echo -e "${BLUE}El Caballero:${NC} un valiente defensor de la verdad y la justicia, capaz de mermar el daño causado por un ataque enemigo en cada combate." | pv -qL30
sleep 2
echo -e "$RED$(cat $MAGA_ASCII)$NC" | pv -qL2222
echo -en "$PROMPT "
echo -e "${RED}La Maga:${NC} una hechicera llena de trucos bajo la manga, capaz de restablecer limitadas veces la energía vital del equipo y brindar pistas para la resolución de los acertijos que encontrarán en su odisea." | pv -qL30
# sleep 2
# echo -e ""
# read -p "$MENSAJE_ENTER"
# echo -e ""

# # clear

echo -en "$PROMPT "
echo -e "Para poder vencer a los enemigos, deberan atacarlos desde la ${bold}TTY2${NC} ${YELLOW}[Todavía no te cambies de TTY]${NC}, un subespacio conectado a mi mundo donde podran sacar a relucir sus principales poderes: ${bold}Los Comandos.${NC}" | pv -qL30
echo -en "$PROMPT "
echo -e "Sin embargo, para que hagan efecto deben usar un comando especial: ${bold}'attack'${NC} antes de sus comandos." | pv -qL30
echo -en "$PROMPT "
echo -e "Vamos a practicar un poco, ejecuten ${bold}'attack 0'${NC}" | pv -qL30
sleep 0.5
while [ "$COMMAND1" != "attack 0" ]
do
    echo -en "$PROMPT_PRENUEVO_BUG "
    read COMMAND1
    if [ "$COMMAND1" != "attack 0" ]
    then
        echo -en "$PROMPT "
        echo -e "Escribiste mal el comando... Si no escribes bien, tendras muchos problemas en el futuro. Intentalo otra vez:" | pv -qL30
    fi
done
sleep 0.5
echo -en "$PROMPT "
echo -e "Bien! Asi podran atacar al monstruo con identificador 0. Ahora ejecuta ${bold}'ls'${NC}" | pv -qL30
sleep 0.5
while [ "$COMMAND2" != "ls" ]
do
    echo -en "$PROMPT_PRENUEVO_BUG "
    read COMMAND2
    if [ "$COMMAND2" != "ls" ]
    then
        echo -en "$PROMPT "
        echo -e "¿Escribiste mal ${bold}'ls'${NC}? Tal vez me equivoque en elegirlos... Bueno no importa, intentalo de nuevo:" | pv -qL30
    fi
done
sleep 0.5
echo -en "$PROMPT "
echo -e "¡Excelente!" | pv -qL30
echo -en "$PROMPT "
echo -e "De esta forma se usa el comando attack, recuerden verificar el ID del monstruo antes de atacarlo." | pv -qL30
echo -en "$PROMPT "
echo -e "Luego de atacar, se les dara un codigo el cual les permitira destruir al enemigo." | pv -qL30
echo -en "$PROMPT "
echo -e "Sin embargo, si el comando usado luego de attack es incorrecto, el código tambien lo será." | pv -qL30
echo -en "$PROMPT "
echo -e "Esto le dará una oportunidad al monstruo de atacarlos a ustedes y perderán vida." | pv -qL30
echo -en "$PROMPT "
echo -e "Si pierden toda su vida, tendran que recorrer el mundo de nuevo." | pv -qL30
echo -en "$PROMPT "
echo -e "Tengan mucho cuidado." | pv -qL30
# sleep 2
# echo -e ""
# read -p "$MENSAJE_ENTER"
# echo -e ""

# # clear

echo -en "$PROMPT "
echo -e "Si deciden que un enemigo es mas poderoso que ustedes, podran huir del combate, pero eso les costara vida, asi que piensenlo bien." | pv -qL30
echo -en "$PROMPT "
echo -e "Ademas, para avanzar por los mundos deberan vencer a los jefes de la zona actual, así que el enfrentamiento es obligatorio." | pv -qL30
# sleep 2
# echo -e ""
# read -p "$MENSAJE_ENTER"
# echo -e ""

# # clear

echo -en "$PROMPT "
echo -e "¡Eso es todo por ahora heroes!" | pv -qL30
echo -en "$PROMPT "
echo -e "Cuento con ustedes, mi última esperanza." | pv -qL30
echo -en "$PROMPT "
echo -e "Ya no me quedan suficientes fuerzas para seguir hablándoles, así que a partir de ahora estarán solos." | pv -qL30
sleep 1
echo -en "$PROMPT "
echo -e "No me fallen..." | pv -qL20
sleep 2
echo -e ""
read -p "$MENSAJE_ENTER"
echo -e ""

clear

chvt $TTY