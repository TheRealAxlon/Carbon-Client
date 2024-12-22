@echo off
title CARBON 

:: Source Code
set "pastebin_url=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/CarbonLoaderRaw.bat"


set "target_dir=%userprofile%\Documents\CARBON\Source"
set "target_file=%target_dir%\CARBON_ClientLoad.bat"


if not exist "%target_dir%" (
    mkdir "%target_dir%"
)

ping -n 1 google.com >nul 2>&1
if errorlevel 1 (
    if exist "%target_file%" (
        start "" "%target_file%"
    ) else (
        echo No Save
    )
    pause
    exit
)

powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%pastebin_url%', '%target_file%')" >nul 2>&1

if not exist "%target_file%" (
    if exist "%target_file%" (
        start "" "%target_file%"
    ) else (
        echo Error 204
    )
    pause
    exit
)

echo Running the latest version of CARBON.
start "" "%target_file%"
exit
