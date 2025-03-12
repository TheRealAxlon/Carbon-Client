@echo off
title CARBON LOADER V1 stableish

:: Set URLs
set "pastebin_url=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/CarbonRaw.bat"
set "tloder_url=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/API/Tloader/tloder.bat"
set "aloder_url=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/API/Tloader/aloder.bat"

:: Set file paths
set "target_dir=%userprofile%\Documents\CARBON\Source"
set "target_dip=%userprofile%\Documents\CARBON\Pref"
set "target_file=%target_dir%\CARBON_ClientApp.bat"
set "theme_file=%target_dip%\theme.txt"
set "tloder_file=%target_dir%\API\tloder.bat"
set "aloder_file=%target_dir%\API\aloder.bat"

:: Default theme color (Purple)
set "default_color=08"

:: Create target directories if they don't exist
if not exist "%target_dir%" (
    mkdir "%target_dir%"
)

:: Create the API folder inside Documents\CARBON\Source if it doesn't exist
if not exist "%target_dir%\API" (
    mkdir "%target_dir%\API"
)

:: Create the Pref folder if it doesn't exist
if not exist "%target_dip%" (
    mkdir "%target_dip%"
)

:: Set theme color based on the saved theme file, or use default
if exist "%theme_file%" (
    for /f "delims=" %%A in (%theme_file%) do set "theme_color=%%A"
) else (
    set "theme_color=%default_color%"
)
color %theme_color%

:: Check for internet connection
echo loading.
ping -n 1 google.com >nul 2>&1
if errorlevel 1 (
    echo No internet connection. Loading saved...
    if exist "%target_file%" (
        start "" "%target_file%"
    ) else (
        echo No Save found
    )
    pause
    exit
)

:: Download the main client batch file (CarbonRaw.bat)
echo Downloading the latest Carbon...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%pastebin_url%', '%target_file%')" >nul 2>&1

:: Verify if the main client batch file was downloaded successfully
if not exist "%target_file%" (
    echo Error downloading the main client. Exiting.
    pause
    exit
)

echo Downloading aloder.bat...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%tloder_url%', '%tloder_file%')" >nul 2>&1


echo Downloading tloder.bat...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%aloder_url%', '%aloder_file%')" >nul 2>&1


if not exist "%tloder_file%" (
    echo Error downloading tloder.bat. Exiting.
    pause
    exit
)



if not exist "%aloder_file%" (
    echo Error downloading aloder.bat. Exiting.
    pause
    exit
)

:: Running the main client app after downloading the necessary files
echo Running the latest version of CARBON.
start "" "%target_file%"
exit
