#!/bin/bash

function salir() {
    exit 1
}

trap salir SIGINT

function verificar_credenciales {
    local usuario=$1
    local contrasena=$2
    
    if [ "$usuario" == "admin" ] && [ "$contrasena" == "contraseña" ]; then
        echo "Credenciales válidas. Acceso concedido."
    else
        echo "Credenciales inválidas. Acceso denegado."
    fi
}

while true; do
    echo "Menu:"
    echo "1. Brute Force Contraseña"
    echo "2. Brute Force Usuario y Contraseña"
    echo "3. Salir"
    read -p "Seleccione una opción: " opcion
    
    case $opcion in
        1)
            read -p "Ingrese la URL: " url
            read -p "Ingrese la ruta del archivo de contraseñas: " ruta_contraseñas
            
            echo
            
            while IFS= read -r contrasena_brute; do
                echo -e "[+] Probamos con la contraseña $contrasena_brute"
                verificar_credenciales "admin" "$contrasena_brute"
                sleep 1
            done < "$ruta_contraseñas"
        ;;
        2)
            read -p "Ingrese la URL: " url
            read -p "Ingrese la ruta del archivo de usuarios: " ruta_usuarios
            read -p "Ingrese la ruta del archivo de contraseñas: " ruta_contraseñas
            
            echo
            
            while IFS= read -r usuario; do
                while IFS= read -r contrasena_brute; do
                    echo -e "[+] Probamos con el usuario: $usuario y contraseña: $contrasena_brute"
                    verificar_credenciales "$usuario" "$contrasena_brute"
                    sleep 1
                done < "$ruta_contraseñas"
            done < "$ruta_usuarios"
        ;;
        3)
            echo "Saliendo del programa."
            exit 0
        ;;
        *)
            echo "Opción inválida. Por favor, seleccione 1, 2 o 3."
        ;;
    esac
done
