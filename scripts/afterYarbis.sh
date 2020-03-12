#!/bin/bash

./Yarbis.sh

M1="Y la raza más débil vuelve a ganar."
M2="Que patética historia."
M3="Al menos logré comer cachapas con chicharrón antes de morir."
M4="Nos vemos en el /dev/null, héroes."

./talk "$M1"
./talk "$M2" f
./talk "$M3" f
./talk "$M4" f
sleep 3
clear

M0="El SPACE INVADERS fue finalmente eliminado."
M1="Pero hubieron bajas: los MACkenzies perecieron."
M2="Ahora, sin la tutela de EAS, todo parece estar perdido."
M3="Aguantame las carnes."
M4="Comienzas a recordar algo."
M5="Las palabras que pronunció EAS antes de desaparecer."
M6="'Para crear, primero hay que destruir.'"
M7="FIN"

for t in "$M0"; do pv -qL15 <<<$t; done; sleep 2
for t in "$M1"; do pv -qL15 <<<$t; done; sleep 2
for t in "$M2"; do pv -qL15 <<<$t; done; sleep 2
for t in "$M3"; do pv -qL15 <<<$t; done; sleep 2
for t in "$M4"; do pv -qL15 <<<$t; done; sleep 2
for t in "$M5"; do pv -qL15 <<<$t; done; sleep 2
for t in "$M6"; do pv -qL10 <<<$t; done; sleep 2
for t in "$M7"; do pv -qL1 <<<$t; done; sleep 3
