@echo off
mode 80, 28
title CARBON
chcp 65001 >nul
cls

:: Set necessary variables
set "base_folder=%USERPROFILE%\Documents\CARBON"
set "pref_folder=%base_folder%\Pref"
set "addons_folder=%base_folder%\Addons"
set "tools_folder=%base_folder%\Data\Tools"
set "other_folder=%base_folder%\Data\Other"
set "temp_folder=%base_folder%\Data\Temp"
set "news_url=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/Exper/NewsDataStatus.txt"
set "news_file=%temp_folder%\MenuText"
set "open_apps_file=%base_folder%\Source\API\tloder.bat"

:: Ensure necessary folders exist
if not exist "%base_folder%" mkdir "%base_folder%"
if not exist "%pref_folder%" mkdir "%pref_folder%"
if not exist "%addons_folder%" mkdir "%addons_folder%"
if not exist "%tools_folder%" mkdir "%tools_folder%"
if not exist "%other_folder%" mkdir "%other_folder%"
if not exist "%temp_folder%" mkdir "%temp_folder%"

:: Fetch the latest news content
curl -s "%news_url%" -o "%news_file%"

:: Check if the news file was downloaded successfully
if exist "%news_file%" (
    set /p news_content=<"%news_file%"
) else (
    set "news_content=Still In testing"
)

:: Load theme color
set "color_file=%pref_folder%\theme.txt"
if exist "%color_file%" (
    for /f "delims=" %%A in (%color_file%) do set "theme_color=%%A"
) else (
    set "theme_color=08" :: Default color if no theme is saved
)

:: Apply saved color
color %theme_color%

:start
cls
ping localhost -n 2 >nul
echo ▄▄▄▄·  ▄· ▄▌ ▄▄▄· ▄▄▄· .▄▄ · .▄▄ ·
ping localhost -n 1 >nul
echo ▐█ ▀█▪▐█▪██▌▐█ ▄█▐█ ▀█ ▐█ ▀. ▐█ ▀.
ping localhost -n 1 >nul
echo ▐█▀▀█▄▐█▌▐█▪ ██▀·▄█▀▀█ ▄▀▀▀█▄▄▀▀▀█▄
ping localhost -n 1 >nul
echo ██▄▪▐█ ▐█▀·.▐█▪·•▐█ ▪▐▌▐█▄▪▐█▐█▄▪▐█
ping localhost -n 1 >nul
echo ·▀▀▀▀   ▀ • .▀    ▀  ▀  ▀▀▀▀  ▀▀▀▀
ping localhost -n 1 >nul
echo ============================
echo         Carbon v1.1.3 Beta
echo ============================
echo    %news_content%
echo ============================
echo    [Settings]         [1]
echo    [Tools]            [2]
echo    [Download]         [3]
echo    [Addons]           [4]
echo    [Exit]             [5]
echo ----------------------------
set /p choice="Select an option: "
if "%choice%"=="1" goto settings
if "%choice%"=="2" goto open_tools_menu
if "%choice%"=="3" goto Download
if "%choice%"=="4" goto addons
if "%choice%"=="5" exit
if /i "%choice%"=="DEV0" goto developer_settings

:: Open Tools or Other Apps Menu
:open_tools_menu
cls
echo ============================
echo        Open Apps
echo ============================
echo [1] Open Tools
echo [2] Open Other Apps
echo [3] Back to Main Menu
echo ============================
set /p choice="Select an option: "

if "%choice%"=="1" (
    if exist "%open_apps_file%" (
        call "%open_apps_file%"
    ) else (
        echo Error: open_apps.bat not found!
        pause
    )
)

if "%choice%"=="2" (
    if exist "%open_apps_file%" (
        call "%open_apps_file%"
    ) else (
        echo Error: open_apps.bat not found!
        pause
    )
)

if "%choice%"=="3" goto start

goto open_tools_menu

:: Addons Section
:addons
cls
echo ============================
echo          Addons
echo ============================

:: Define the Addons folder path
set "addons_folder=%USERPROFILE%\Documents\CARBON\Addons"

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
if "!addon_choice!"=="%count%" goto start

:: Handle Open Addons Folder
if "!addon_choice!"=="%count%-1" (
    echo Opening Addons folder...
    start "" "%addons_folder%"
    pause
    goto addons
)

:: Handle running the selected addon
for /L %%I in (1,1,%count%-2) do (
    if "!addon_choice!"=="%%I" (
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


:: Settings
:settings
cls
echo ============================
echo          Settings
echo ============================
echo    [Carbon Settings]  [1]
echo    [Back]             [2]
echo ----------------------------
set /p settings_choice="Select an option: "
if "%settings_choice%"=="1" goto carbon_settings
if "%settings_choice%"=="2" goto start

:: Carbon Settings
:carbon_settings
cls
echo ============================
echo       Carbon Settings
echo ============================
echo    [Change Theme]  [1]
echo    [Uninstall Carbon] [2]
echo    [Back]           [3]
echo ----------------------------
set /p carbon_choice="Select an option: "
if "%carbon_choice%"=="1" goto change_theme
if "%carbon_choice%"=="2" goto uninstall
if "%carbon_choice%"=="3" goto settings

:: Change Theme
:change_theme
cls
echo ============================
echo        Change Theme
echo ============================
echo Choose a color:
echo [1] Red
echo [2] Green
echo [3] Blue
echo [4] Yellow
echo [5] Carbon
echo ----------------------------
set /p color_choice="Enter the number for the color: "

:: Set the color based on the user's choice
if "%color_choice%"=="1" set "theme_color=04"
if "%color_choice%"=="2" set "theme_color=02"
if "%color_choice%"=="3" set "theme_color=01"
if "%color_choice%"=="4" set "theme_color=0E"
if "%color_choice%"=="5" set "theme_color=08"

:: Save the new theme color in a text file
echo %theme_color% > "%color_file%"

:: Apply the new color
powershell -Command "$wshell = New-Object -ComObject WScript.Shell; $wshell.Popup('Theme color updated successfully', 0, 'Theme Changed', 0x0)"
color %theme_color%
goto carbon_settings

:: Uninstall Carbon
:uninstall
cls
echo ============================
echo        Uninstall Carbon
echo ============================
echo This will delete the CARBON
set /p confirm="Are you sure? (yes/no): "
if /i "%confirm%"=="yes" (
    rmdir /s /q "%folder%"
    powershell -Command "$wshell = New-Object -ComObject WScript.Shell; $wshell.Popup('Successfully uninstalled Carbon', 0, 'Uninstall Complete', 0x0)"
    echo Carbon has been uninstalled.
    pause
    exit
) else (
    echo Uninstall cancelled.
    pause
    goto carbon_settings
)
