@echo off
title CARBON LOADER V1

:: Set up a validation key
set "carbon_key=UNIQUE-LOADER-KEY"
set "carbon_temp_file=%temp%\carbon_loader.tmp"

:: Write the validation key to a temp file
echo %carbon_key% > "%carbon_temp_file%"

:: Define the Carbon source URL
set "pastebin_url=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/CarbonRaw.bat"
set "target_dir=%userprofile%\Documents\CARBON"
set "target_file=%target_dir%\CARBON_ClientAPP.bat"

:: Create the target directory if it doesn't exist
if not exist "%target_dir%" mkdir "%target_dir%"

:: Check for internet connection
echo Checking internet connection...
ping -n 1 google.com >nul 2>&1
if errorlevel 1 (
    echo No internet connection. The loader requires an internet connection to proceed.
    pause
    exit
)

:: Download the latest Carbon source
echo Downloading Carbon source...
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%pastebin_url%', '%target_file%')" >nul 2>&1

:: Verify if the file downloaded successfully
if not exist "%target_file%" (
    echo Failed to download Carbon. Please try again later.
    pause
    exit
)

:: Launch Carbon with the validation key
start "" "%target_file%"
exit
