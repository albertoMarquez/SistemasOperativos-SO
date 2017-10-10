#! /bin/bash

if [ ! $# -eq 3 ]
then
    echo "Debe introducir tres ficheros como parametros"
    exit 1
fi

if [[ ! -e $1 && ! -e $2 && ! -e $3 ]]
then
    echo "Alguno de los archivos no esta en el dir actual o no existe"
    exit 1
fi

echo "00000000000000000000000000000011" > salidaScript.mtar
du -b $1 $2 $3 | cat >> salidaScript.mtar
cat $1 $2 $3 >> salidaScript.mtar

echo "Archivo creado"
exit 1
