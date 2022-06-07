#!/bin/bash

compose () {
    echo Starting compose...
    docker compose up --wait
    if [ $? >= 0 ]; then
        echo "\033[0;31mCritical: An error occured during composing. Please check the logs.\033[0;0m"
    else
        echo "\033[0;32mOperation completed successfully.\033[0;0m"
    fi
}

# User may set enviroment variable GUI_PORT, to set the port to access the GUI from.
echo Welcome to PCAT-System setup!

if [-f "compose.yaml"]; then
    compose
else
    echo "\033[0;31m[31mCiritical: "compose.yaml" is not found in the current directory.\033[0;0m"
fi
exit
