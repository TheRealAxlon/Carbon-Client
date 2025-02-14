@echo off
title CARBON lOADER V1 Unstable


set "pastebin_url=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/CarbonRaw.bat"


set "target_dir=%userprofile%\Documents\CARBON\Source"
set "target_dip=%userprofile%\Documents\CARBON\Pref"
set "target_file=%target_dir%\CARBON_ClientApp.bat"
set "theme_file=%target_dip%\theme.txt"


set "default_color=08" :: Purple


if not exist "%target_dir%" (
    mkdir "%target_dir%"
)


if exist "%theme_file%" (
    for /f "delims=" %%A in (%theme_file%) do set "theme_color=%%A"
) else (
    set "theme_color=%default_color%"
)
color %theme_color%


echo loading.
ping -n 1 google.com >nul 2>&1
if errorlevel 1 (
    echo No internet connection.  Loading save...
    if exist "%target_file%" (
        start "" "%target_file%"
    ) else (
        echo No Save
    )
    pause
    exit
)


echo Loading..
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%pastebin_url%', '%target_file%')" >nul 2>&1

:: Verify if the file downloaded successfully
if not exist "%target_file%" (
    echo Loading...
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
