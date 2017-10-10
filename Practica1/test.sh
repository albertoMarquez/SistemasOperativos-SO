#! /bin/bash

if [[ ! -e "mytar" && ! -x "mytar" ]]
then
    echo "El ejecutable mytar no esta en este directorio."
    exit 1
fi

if [[ -d "tmp" ]]
then
    echo "Exixte el dir tmp, se borrara"
    rm -r tmp
fi

mkdir tmp && cd tmp

echo "Hello world!" > file1.txt
head -n10 /etc/passwd > file2.txt
head -c1024 /dev/urandom > file3.txt

.././mytar -cf filetar.mtar file1.txt file2.txt file3.txt

mkdir out && cp filetar.mtar out

cd out && ../.././mytar -xf filetar.mtar

if diff file1.txt ../file1.txt && diff file2.txt ../file2.txt && diff file3.txt ../file3.txt &> /dev/null
then
    cd ../..
    echo "Correct"
    exit 0
else
    cd ../..
    echo "Los archivos no son iguales"
    exit 1
fi