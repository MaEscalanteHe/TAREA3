import itertools
import fileinput
import random
from random import randint
from random import choice
import os
import pwd
import crypt
import string
from string import lowercase, uppercase
import sys

#FUNCIONES:

# Crea la ruta y le mete n archivos y n carpetas
# # Se leen palabras de un diccionaro para crear las carpetas crap con esos nombres
f = open('/etc/dictionaries-common/words','r')
crap = f.readlines()
respaldo = crap
f.close()
random.shuffle(crap)

lineas = respaldo
# random_N_digitos: dado un numero, devuelve un numero aleatorio de n cifras
def random_N_digitos(n):
	rango_ini = 10**(n-1)
	rango_fin = (10**n)-1
	return randint(rango_ini, rango_fin)

# DirBasura: crea una ruta y la llena de n archivos y carpetas crap
def DirBasura(ruta, n):
	if not os.path.exists(ruta):
		os.mkdir(ruta)
	for i in range(int(n)):
		os.mkdir(ruta + '/' + (crap.pop()).strip()) # Crea n Carpetas crap
		archivo = open(ruta + '/' + (crap.pop()).strip() , 'w', 0) # Crea n archivos crap

def DirBasuraMAYUS(ruta, n):
	if not os.path.exists(ruta):
		os.mkdir(ruta)
	for i in range(int(n)):
		os.mkdir(ruta + '/' + (crap.pop().upper()).strip()) # Crea n Carpetas crap
		archivo = open(ruta + '/' + (crap.pop().upper()).strip() , 'w', 0) # Crea n archivos crap

# ArchivosBasura: crea una ruta y la llena de n archivos crap
def ArchivosBasura(ruta, n):
	if not os.path.exists(ruta):
		os.mkdir(ruta)
	for i in range(int(n)):
		archivo = open(ruta + '/' + crap.pop().strip() , 'w', 0) # Crea n archivos crap

# ArchivosBasuraLog: crea una ruta y la llena de n archivos.log crap
def ArchivosBasuraLog(ruta, n):
	if not os.path.exists(ruta):
		os.mkdir(ruta)
	for i in range(int(n)):
		archivo = open(ruta + '/' + crap.pop().strip() + '.log' , 'w', 0) # Crea n archivos crap

# CrearArchivo: Crea archivo con n lineas basura
def CrearArchivo(ruta, n):
    archivo = open(ruta, 'w', 0)
    for i in range(int(n)):
        archivo.write(crap.pop().strip() + '\n')

######################################## CONSTRUCCION MUNDOS #####################################

##############################
#        MUNDO ELYIANO       #
##############################

# Limpieza Previa
os.system('rm -rf /home/Uc207Pr4f57t9/Digimundo/ElYiano/*')

# Llenamos el mundo con archivos y directorios basura
DirBasura('/home/Uc207Pr4f57t9/Digimundo/ElYiano', 1000)
ArchivosBasuraLog('/home/Uc207Pr4f57t9/Digimundo/ElYiano', 1000)

# Garantizo que no existan las siguientes carpetas y luego las creo
os.system('find /home/Uc207Pr4f57t9/Digimundo/ElYiano -name _ZOR | xargs rm -rf')
os.system('find /home/Uc207Pr4f57t9/Digimundo/ElYiano -name _DAE | xargs rm -rf')
os.system('find /home/Uc207Pr4f57t9/Digimundo/ElYiano -name mmdm  | xargs rm -rf')

# Creo las carpetas de nivel 2 y sus archivos .log para el reto (reto CODENo3)
os.system('mkdir -p /home/Uc207Pr4f57t9/Digimundo/ElYiano/_ZOR/_RRA')
os.system('mkdir -p /home/Uc207Pr4f57t9/Digimundo/ElYiano/_DAME/_KULO')
os.system('touch /home/Uc207Pr4f57t9/Digimundo/ElYiano/_ZOR/_RRA/BienPerros.log')
os.system('touch /home/Uc207Pr4f57t9/Digimundo/ElYiano/_DAME/_KULO/SiganAdelante.log')

# Creacion de archivos crap en el segundo nivel de el yiano
ArchivosBasura('/home/Uc207Pr4f57t9/Digimundo/ElYiano/_ZOR/_RRA/', 1419)
ArchivosBasura('/home/Uc207Pr4f57t9/Digimundo/ElYiano/_DAME/_KULO/', 1419)
ArchivosBasuraLog('/home/Uc207Pr4f57t9/Digimundo/ElYiano/_ZOR', 1420)
ArchivosBasuraLog('/home/Uc207Pr4f57t9/Digimundo/ElYiano/_DAME', 1420)

# Creacion archivo con contenido cracp excepto linea 90 (reto CODE No 8)
CrearArchivo('/home/Uc207Pr4f57t9/Digimundo/ElYiano/loquesea', 500)
os.system('sed \'90s/.*/ANACO_JP/\' /home/Uc207Pr4f57t9/Digimundo/ElYiano/loquesea > /home/Uc207Pr4f57t9/Digimundo/ElYiano/UNDYNE')

# Message Status
print('Mundo El Yiano Creado..')

##############################
#        MUNDO MAGICANT      #
##############################


# Limpieza Previa
os.system('rm -rf /home/Uc207Pr4f57t9/Digimundo/Magicant/*')

# Creacion de archivos Basura
DirBasura('/home/Uc207Pr4f57t9/Digimundo/Magicant', 1000)

# Creacion de Archivos RIM WORLD (reto CODE No 9)
CrearArchivo('/home/Uc207Pr4f57t9/Digimundo/Magicant/WORLD', 100)
os.system('cp /home/Uc207Pr4f57t9/Digimundo/Magicant/WORLD /home/Uc207Pr4f57t9/Digimundo/Magicant/RIM')
for i in range(420):
	str0 = "".join(choice(lowercase) for j in range(4))
	os.system('echo "'+(((lineas.pop()).lower()).replace("'","")).strip("\n")+'" >> /home/Uc207Pr4f57t9/Digimundo/Magicant/RIM')

# Creacion de Archivos en MAYUSCULA (reto CODE No 10)
for i in range(67):
	str0 = "".join(choice(lowercase) for j in range(4))
	os.system('touch "/home/Uc207Pr4f57t9/Digimundo/Magicant/'+(((lineas.pop()).upper()).replace("'","")).strip("\n")+'"')

# Creacion de archivo FLOWY (reto CODE No 15)
CrearArchivo('/home/Uc207Pr4f57t9/Digimundo/Magicant/FLOWY',500)
os.system('echo "Jose construye Barreras" >> /home/Uc207Pr4f57t9/Digimundo/Magicant/FLOWY')
for i in range(499):
	str0 = "".join(choice(lowercase) for j in range(4))
	os.system('echo "'+(((lineas.pop()).lower()).replace("'","")).strip("\n")+'" >> /home/Uc207Pr4f57t9/Digimundo/Magicant/FLOWY')

# Creacion del archivo TORIEL (reto CODE No 16)
numeros = list(range(1, 1000))
random.shuffle(numeros)
for i in range(999):
	num = numeros.pop()
	if num == 1:
		os.system('echo "'+str(num)+'SoPoRTALo" >> /home/Uc207Pr4f57t9/Digimundo/Magicant/TORIEL')
	else:
		os.system('echo "'+str(num)+(((lineas.pop()).lower()).replace("'","")).strip("\n")+'" >> /home/Uc207Pr4f57t9/Digimundo/Magicant/TORIEL')

# Creacion de archivos basura borrar[6-9] y archivos correctos borrar[1-5] (reto CODE No 5)
for i in range(300):
	num = random_N_digitos(4)
	os.system('touch /home/Uc207Pr4f57t9/Digimundo/Magicant/borrar'+str(num)+'')


# Message Status
print('Mundo El Magicant Creado..')


##############################
#        MUNDO LAPUTA        #
##############################

# Limpieza Previa
os.system('rm -rf /home/Uc207Pr4f57t9/Digimundo/LaPuta/*')

# Creacion archivos de 4 y 7 caracteres (reto CODE No 7)
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/LaPuta/DIR')
for i in range(100):
	str0 = "".join(choice(lowercase) for j in range(4))
	os.system('touch "/home/Uc207Pr4f57t9/Digimundo/LaPuta/"'+str0+'')
for i in range(100):
	str0 = "".join(choice(lowercase) for j in range(5))
	os.system('touch "/home/Uc207Pr4f57t9/Digimundo/LaPuta/"'+str0+'')
for i in range(100):
	str0 = "".join(choice(lowercase) for j in range(6))
	os.system('touch "/home/Uc207Pr4f57t9/Digimundo/LaPuta/"'+str0+'')
for i in range(100):
	str0 = "".join(choice(lowercase) for j in range(7))
	os.system('touch "/home/Uc207Pr4f57t9/Digimundo/LaPuta/"'+str0+'')

# Creacion de Carpetas CUP y HEAD con archivos comunes y no comunes (reto CODE No 18)
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/LaPuta/CUP')
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/LaPuta/HEAD')

DirBasura('/home/Uc207Pr4f57t9/Digimundo/LaPuta/CUP', 300)
DirBasura('/home/Uc207Pr4f57t9/Digimundo/LaPuta/HEAD', 300)

masks=['IGvuelve','RM_Esta_vIvo','PirateoMaximo','LDCnUnCaNoSsUperAA','MACFTW','MEFuTuRoBate','ALpaLaNASA', 'JZnarrador']
for i in masks:
	os.system('touch -t 202410241000 "/home/Uc207Pr4f57t9/Digimundo/LaPuta/CUP/"'+i+'')
	os.system('echo "Actualizado0o0o0o" >> /home/Uc207Pr4f57t9/Digimundo/LaPuta/CUP/'+i+'')
for i in masks:
	os.system('touch "/home/Uc207Pr4f57t9/Digimundo/LaPuta/HEAD/"'+i+'')
	os.system('echo "DEEESactualizadOOOOO" >> /home/Uc207Pr4f57t9/Digimundo/LaPuta/HEAD/'+i+'')

# Message Status
print('Mundo LaPuta Creado..')

##############################
#      MUNDO Konohagakure    #
##############################

# Limpieza Previa
os.system('rm -rf /home/Uc207Pr4f57t9/Digimundo/Konohagakure/*')

# Creacion archivo con X kb y archivo con X numero de lineas (reto CODE No 19)
for i in range(280):
	os.system('echo "TarEa3" >> /home/Uc207Pr4f57t9/Digimundo/Konohagakure/PADRE_EAS')
DirBasura('/home/Uc207Pr4f57t9/Digimundo/Konohagakure/',900)
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/Konohagakure/Secretish')
CrearArchivo('/home/Uc207Pr4f57t9/Digimundo/Konohagakure/Secretish/JK_Te_Vigila', 2)

# Creacion archivo Uc207Pr4f57t9.txt (reto CODE No 6)
mask = ["JK","AL","JO","JT","ME","CR","MC","JZ","JY","MD","D10S"]
for i in mask:
	os.system('touch /home/Uc207Pr4f57t9/Digimundo/Konohagakure/Uc207Pr4f57t9_'+i+'.txt')

# Creacion Carpeta DIR con contenido (reto CODE No 18)
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/Konohagakure/MAC')
os.system('mkdir /home/Uc207Pr4f57t9/Digimundo/Konohagakure/MAC/GL1')

mask2 = ["JK","AL","JO","JT","ME","CR","MC","JZ","JY","MD","D10S","JP","MA","AA","GR","AN","DS","DT","WOOLO","EAS","GS","AV"]
gl1 = ["JK","AL","JP","GR","AA","DT","EAS"]
for i in mask2:
	os.system('touch /home/Uc207Pr4f57t9/Digimundo/Konohagakure/MAC/'+i+'')
for i in gl1:
	os.system('touch /home/Uc207Pr4f57t9/Digimundo/Konohagakure/MAC/GL1/'+i+'')


# Message Status
print('Mundo Konohagakure Creado..')

##############################
#        MUNDO NEOVICE       #
##############################

# Limpieza Previa
os.system('rm -rf /home/Uc207Pr4f57t9/Digimundo/NeoVice/*')
os.system('killall ping 2> /dev/null ; killall yes 2> /dev/null')

# Creacion de archivos Basura
DirBasura('/home/Uc207Pr4f57t9/Digimundo/NeoVice/', 1000)

# Creacion de archivos Basura (reto CODE No 25)
DirBasura('/home/Uc207Pr4f57t9/Digimundo/NeoVice/Koz', 1000)

# Creacion de procesos yes (reto CODE No 4)
os.system('yes > /dev/null &')

# Creacion de procesos xeyes (reto CODE No 14)
os.system('ping 159.90.9.127 > /dev/null 2> /dev/null &')
os.system('ping 159.90.9.127 > /dev/null 2> /dev/null &')

# Message Status
print('Mundo NeoVice Creado..')
