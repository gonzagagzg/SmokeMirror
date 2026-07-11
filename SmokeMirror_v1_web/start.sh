#!/bin/bash
PORT="${1:-8080}"
export PORT
echo -e "\e[36mIniciando SmokeMirror en el puerto $PORT...\e[0m"
node server.js

if [ $? -ne 0 ]; then
  echo -e "\e[31mError: Asegúrate de tener Node.js instalado.\e[0m"
  echo -e "\e[33mDescárgalo desde: https://nodejs.org/\e[0m"
fi
