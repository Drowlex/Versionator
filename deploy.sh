#!/bin/bash

# https://ed.team/blog/como-se-deciden-las-versiones-del-software

# v0.0.0.0

# vx,y,z,p

# El primero (X) se le conoce como versión mayor y nos indica la versión principal del software. Ejemplo: 1.0.0, 3.0.0
# El segundo (Y) se le conoce como versión menor y nos indica nuevas funcionalidades. Ejemplo: 1.2.0, 3.3.0
# El tercero (Z) se le conoce como revisión y nos indica que se hizo una revisión del código por algun fallo. Ejemplo: 1.2.2, 3.3.4

# Versión mayor o X, cuando agreguemos nuevas funcionalidades importantes, puede ser como un nuevo modulo o característica clave para la funcionalidad.
# Versión menor o Y, cuando hacemos correcciones menores, cuando arreglamos un error y se agregan funcionalidades que no son cruciales para el proyecto.
# Revisión o Z, cada vez que entregamos el proyecto.

# En el caso de los parches podemos agregar un dígito para señalar el parche, ya teníamos algo así: X.Y.Z y ahora tendríamos algo así: X.Y.Z.P así que P sería el número del parche:

getVersion() {

    # Versión desplegada...
    Fichero=version_$1.json


    CurrentVersionX=$(grep -oP '(?<="x": ")[^"]*' $Fichero)
    CurrentVersionY=$(grep -oP '(?<="y": ")[^"]*' $Fichero)
    CurrentVersionZ=$(grep -oP '(?<="z": ")[^"]*' $Fichero)
    CurrentVersionP=$(grep -oP '(?<="p": ")[^"]*' $Fichero)

    echo -e "\n🎉 Last version: $CurrentVersionX.$CurrentVersionY.$CurrentVersionZ.$CurrentVersionP 🎉"    
}
compilation() {
    # Actualizar la versión
    bash version_json.sh $1;
    # Versión desplegada...
    Fichero=version_$1.json


    # ============================================================================
    # INICIA ALGORITMO DE COMPILACIÓN
    # ============================================================================
    echo -e "\nCompile and deploy ... $1 to $2" 
    date +"%H:%M:%S"

    # sleep 10

    echo -e "\nDeployment ... $1 to $2" 
    date +"%H:%M:%S"
    # ============================================================================
    # FIN ALGORITMO DE COMPILACIÓN
    # ============================================================================



    getVersion $1;
}

services_menu() {
    echo -e "\n";
    echo -e ">>> MENU OF DEPLOYEMENT TO $1 <<<"
    echo "A) Deploy Aplication 1"
    echo "B) Deploy Aplicacion 2"
    echo "0) Cancel and close"
    echo -e "\n"
}

main_service() {
    greeting;
    services_menu $1;
    while true; do
        echo -n "Option? [A,B,0]:"
        read -n1 yn
        case $yn in
            [Aa]* ) 
                compilation app1 $1; 
                break;;
            [Bb]* ) 
                compilation app2 $1; 
                break;;
            0 ) 
                echo -e "\nBye..."; 
                exit;;
            * ) echo -e "\nWrong option.";;
        esac
    done
}

intro_menu () {
    echo -e "\n";
    echo -e ">>> MENU OF DEPLOYEMENT <<<"
    echo "A) Deploy to aws"
    echo "B) Deploy to nexus"
    echo "0) Cancel and close"
    echo -e "\n"

}

main_deploy() {
    greeting;
    intro_menu;
    while true; do
        echo -n "Option? [A,B,0]:"
        read -n1 yn
        case $yn in
            [Aa]* ) 
                main_service AWS; 
                break;;
            [Bb]* ) 
                main_service NEXUS; 
                break;;
            0 ) 
                echo -e "\nBye..."; 
                exit;;
            * ) echo -e "\nWrong option.";;
        esac
    done
}

greeting() {
    clear;
    echo -e "\t 🔥🦖 VERSIONATOR 🦖🔥"
    echo -e "\n"
}
main () {
    greeting;
    while true; do
        echo -n "Are you sure to deploy? [y,n]:"
        read -n1 yn
        case $yn in
            [Yy]* ) 
                main_deploy; 
                break;;
            [Nn]* ) 
                echo -e "\nBye..."; 
                exit;;
            * ) echo -e "\nWrong option.";;
        esac
    done
}
main