@echo off
title CARBON - Addons

:: Define the Addons folder path
set "addons_folder=%USERPROFILE%\Documents\CARBON\Addons"
set "client_app=%USERPROFILE%\Documents\CARBON\Source\Addons\API\CARBON_ClientApp.bat"

:addons
cls
echo ============================
echo          Addons
echo ============================

:: Ensure the Addons folder exists
if not exist "%addons_folder%" (
    echo The Addons folder does not exist. Creating it now...
    mkdir "%addons_folder%"
)

:: List available addons
setlocal enabledelayedexpansion
set /a count=0
for %%A in ("%addons_folder%\*.bat") do (
    set /a count+=1
    echo [!count!] %%~nA
    set "addon!count!=%%A"
)

:: Add option to open Addons folder
set /a count+=1
echo [!count!] Open Addons Folder

:: Add option to return to the main menu
set /a count+=1
echo [!count!] Back to Main Menu

:: Prompt user for choice
set /p addon_choice="Select an option: "

:: Handle Back to Main Menu
if "%addon_choice%"=="%count%" goto open_clientapp

:: Handle Open Addons Folder
if "%addon_choice%"=="%count%-1" (
    echo Opening Addons folder...
    start "" "%addons_folder%"
    pause
    goto addons
)

:: Handle running the selected addon
for /L %%I in (1,1,%count%-2) do (
    if "%addon_choice%"=="%%I" (
        echo Running addon: !addon%%I!
        call "!addon%%I!"
        pause
        goto addons
    )
)

:: Handle invalid input
echo Invalid option. Please try again.
pause
goto addons

:: Open CARBON_ClientApp and Exit
:open_clientapp
start "" "%client_app%"
exit
