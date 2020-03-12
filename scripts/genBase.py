import itertools
import fileinput
import random
from random import randint
from random import choice
import os
import pwd
import crypt
import string
import sys

################################# CREACION DE USUARIOS ################################################
# (EAS: jarvis.sh | Uc207Pr4f57t9: User donde los prenuevos corren comandos)

# Verificar que no hay usuarios ya creados
os.system('userdel -r EAS 2> /dev/null')
os.system('userdel -r Uc207Pr4f57t9 2> /dev/null')
os.system('apt install pv lolcat mplayer -y')

# Message status
print ('CREANDO USUARIO Uc207Pr4f57t9 y EAS..')

# Creando hash de passwords de los 2 usuarios
EAS_passwd = crypt.crypt('macrulez','22')
Uc207Pr4f57t9_passwd = crypt.crypt('la password debio ser ese user','22')

# Creando usuarios
os.system('useradd -s /bin/bash -p '+ EAS_passwd +' -m EAS')
os.system('useradd -s /bin/bash -p '+ Uc207Pr4f57t9_passwd +' -m Uc207Pr4f57t9')
os.system('usermod -a -G sudo EAS')
os.system('cp -R /root/random/Jarvis /home/EAS')
os.system('echo 0 > /tmp/chance; chmod 777 /tmp/chance')

# Ssh Keygen
os.system('ssh-keygen -t rsa')
print("Introduce la clave de prenuevos (irving) para anadir la llave ssh")
os.system('ssh-copy-id prenuevos@159.90.9.130')

# Permisos para los usuarios
os.system('echo "EAS ALL=NOPASSWD: /bin/chmod" >> /etc/sudoers')
os.system('echo "EAS ALL=NOPASSWD: /bin/kill" >> /etc/sudoers')
os.system('echo "Uc207Pr4f57t9 ALL=NOPASSWD: /bin/kill" >> /etc/sudoers')
os.system('echo "EAS ALL=NOPASSWD: /bin/chown" >> /etc/sudoers')
os.system('echo "EAS ALL=NOPASSWD: /bin/touch" >> /etc/sudoers')
os.system('echo "EAS ALL=NOPASSWD: /bin/mkdir" >> /etc/sudoers')
os.system('echo "EAS ALL=NOPASSWD: /home/EAS/Jarvis/start.sh" >> /etc/sudoers')
os.system('echo "EAS ALL=NOPASSWD: /home/EAS/Jarvis/EAS.sh" >> /etc/sudoers')
os.system('echo "EAS ALL=NOPASSWD: /usr/bin/mplayer" >> /etc/sudoers')


# Message status
print ('USUARIOS CREADOS')

################################# CREACION DE MUNDOS BASE ################################################

#Se crean los directorios habitaciones principales
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/ && chmod 755  /home/Uc207Pr4f57t9/Digimundo/')
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/ElYiano; chmod 755  /home/Uc207Pr4f57t9/Digimundo/ElYiano')
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/Magicant; chmod 700  /home/Uc207Pr4f57t9/Digimundo/Magicant')
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/LaPuta; chmod 700  /home/Uc207Pr4f57t9/Digimundo/LaPuta')
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/Konohagakure; chmod 700  /home/Uc207Pr4f57t9/Digimundo/Konohagakure')
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/NeoVice; chmod 700  /home/Uc207Pr4f57t9/Digimundo/NeoVice')

# Message status
print ('CREANDO CARPETAS DE MUNDOS..')

################################# CREACION DE ALIASES ################################################

#Asignacion de aliases
os.system("echo \"alias ls='ls --color'\" >> /home/Uc207Pr4f57t9/.bashrc")
# os.system('mkdir /home/preparador/admision/ && cp ../credits/credits.py /home/preparador/admision/')
os.system("echo \"alias instakilleas='python3 /home/preparador/admision/credits.py'\" >> /home/Uc207Pr4f57t9/.bashrc")
os.system('echo "alias kill=\'sudo kill\'\" >> /home/Uc207Pr4f57t9/.bashrc')
os.system('echo \'export PATH=$PATH:/tmp/script/\' >> /home/Uc207Pr4f57t9/.bashrc') # Pueden ejecutar .Attack
os.system('echo "alias creditos=\'sudo cat /home/EAS/Jarvis/asiic/creditos.asiic | pv -qL250 |lolcat\'\" >> /home/Uc207Pr4f57t9/.bashrc') # PPara ejecutar los creditos

# Message status
print ('ASIGNACION DE ALIASES EN LOS .bashrc Y CREDITOS..')

#################################  SCRIPTS DISPONIBLES PARA PRENUEVOS ################################################


os.system('mkdir -p /opt/tarea3/scripts')
os.system('cp /root/random/scripts/attack /tmp/script/')

# Fortune
# os.system('cp ../robot/fortunes/* /usr/share/games/fortunes')
# os.system('cp -R ../robot /home/serverfsociety')
# os.system('cp -R ../credits /home/serverfsociety')

# Message status
print ('FORTUNES LISTOS')

# Message status
print ('SCRIPT ATTACK DISPONIBLE EN /opt/tarea3/scripts/')
