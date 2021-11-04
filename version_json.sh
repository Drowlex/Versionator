#!/bin/bash

greeting() {
    clear;
    echo -e "\t 🔥🦖 VERSIONATOR 🦖🔥"
    echo -e "\n🎉 Current version: $NewVersionX.$NewVersionY.$NewVersionZ.$NewVersionP 🎉"    
    echo -e "\n"
}

updateP() {
    greeting;
    while true; do
        echo -n "it's a patch? [y,n]:"
        read -n1 yn
        case $yn in
            [Yy]* ) 
                NewVersionP=$(($NewVersionP+1))
                # Eliminamos el archivo
                rm $Fichero
                json='{"x": "'$NewVersionX'", "y": "'$NewVersionY'" ,"z": "'$NewVersionZ'", "p": "'$NewVersionP'"}'
                echo $json > $Fichero
                exit;;
                # break;;
            [Nn]* ) 
                break;;
            * ) echo -e "\nWrong option.";;
        esac
    done
}
updateZ() {
    greeting;
    while true; do
        echo -n "it's a bug review? [y,n]:"
        read -n1 yn
        case $yn in
            [Yy]* ) 
                NewVersionP=0
                NewVersionZ=$(($NewVersionZ+1))
                # Eliminamos el archivo
                rm $Fichero
                json='{"x": "'$NewVersionX'", "y": "'$NewVersionY'" ,"z": "'$NewVersionZ'", "p": "'$NewVersionP'"}'
                echo $json > $Fichero
                exit;;
                # break;;
            [Nn]* ) 
                break;;
            * ) echo -e "\nWrong option.";;
        esac
    done
}
updateY() {
    greeting;
    while true; do
        echo -n "Are they new features? [y,n]:"
        read -n1 yn
        case $yn in
            [Yy]* ) 
                NewVersionP=0
                NewVersionZ=0
                NewVersionY=$(($NewVersionY+1))
                # Eliminamos el archivo
                rm $Fichero
                json='{"x": "'$NewVersionX'", "y": "'$NewVersionY'" ,"z": "'$NewVersionZ'", "p": "'$NewVersionP'"}'
                echo $json > $Fichero
                exit;;
                # break;;
            [Nn]* ) 
                break;;
            * ) echo -e "\nWrong option.";;
        esac
    done
}
updateX() {
    greeting;
    while true; do
        echo -n "Update the major version? [y,n]:"
        read -n1 yn
        case $yn in
            [Yy]* ) 
                NewVersionP=0
                NewVersionZ=0
                NewVersionY=0
                OldVersionX=$(($OldVersionX+1))
                # Eliminamos el archivo
                rm $Fichero
                json='{"x": "'$NewVersionX'", "y": "'$NewVersionY'" ,"z": "'$NewVersionZ'", "p": "'$NewVersionP'"}'
                echo $json > $Fichero
                exit;;
                # break;;
            [Nn]* ) 
                break;;
            * ) echo -e "\nWrong option.";;
        esac
    done   
}
main_version() {

    # Obtenemos el valor que hay en el archivo
    Fichero=version_$1.json

    # Validamos si existe, de lo contrario se crea :)
    if [ ! -f "$Fichero" ];
    then
        echo -e "\nThe version was initialized"
        # Si no existe, se crea
        json='{"x": "1", "y": "0" ,"z": "0", "p": "0"}'
        echo $json > $Fichero
        # code if not found
        exit
    fi

    # Initial variables

    OldVersionP=$(grep -oP '(?<="p": ")[^"]*' $Fichero)
    NewVersionP=$(($OldVersionP))
    OldVersionZ=$(grep -oP '(?<="z": ")[^"]*' $Fichero)
    NewVersionZ=$(($OldVersionZ))
    OldVersionY=$(grep -oP '(?<="y": ")[^"]*' $Fichero)
    NewVersionY=$(($OldVersionY))
    OldVersionX=$(grep -oP '(?<="x": ")[^"]*' $Fichero)
    NewVersionX=$(($OldVersionX))

    updateP;
    updateZ;
    updateY;
    updateX;
}

main_version $1;