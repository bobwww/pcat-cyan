@echo off
REM User may set enviroment variable GUI_PORT, to set the port to access the GUI from.
ECHO Welcome to PCAT-System setup!

IF EXIST compose.yaml (
    call :compose
) ELSE (
    ECHO [31mCiritical: "compose.yaml" is not found in the current directory.[0m
)
EXIT /B 0

:compose
echo Starting compose...
docker compose up --wait
IF errorlevel 1 (
    ECHO [31mCritical: An error occured during composing. Please check the logs.[0m
) ELSE (
    ECHO [32mOperation completed successfully.[0m
)
EXIT /B 0