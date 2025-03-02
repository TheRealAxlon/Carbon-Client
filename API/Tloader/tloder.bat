@echo off
title CARBON - Open Apps

:: Define the base folder and the source folder for tools and other apps
set "base_folder=%USERPROFILE%\Documents\CARBON"
set "tools_folder=%base_folder%\Data\Tools"
set "other_folder=%base_folder%\Data\Other"

:: Main Menu to choose between Tools or Other Apps
:main_menu
cls
echo ============================
echo        Open Apps
echo ============================
echo [1] Open Tools
echo [2] Open Other Apps
echo [3] Back to Main Menu
echo ============================
set /p choice="Select an option: "

if "%choice%"=="1" goto open_tools
if "%choice%"=="2" goto open_other
if "%choice%"=="3" exit

goto main_menu

:: Open Tools
:open_tools
cls
echo ============================
echo          Tools
echo ============================
setlocal enabledelayedexpansion
set /a count=0

:: Check if the Tools folder exists
if not exist "%tools_folder%" (
    echo No Tools folder found! Returning to the main menu...
    pause
    goto main_menu
)

:: List available tools in the Tools folder
for %%A in ("%tools_folder%\*.bat") do (
    set /a count+=1
    echo [!count!] %%~nA
    set "tool!count!=%%A"
)

:: Prompt user for selection
set /a count+=1
echo [!count!] Back to Main Menu
set /p tool_choice="Select a tool to open: "

if "%tool_choice%"=="%count%" goto main_menu

:: Run the selected tool
for /L %%I in (1,1,%count%-1) do (
    if "%tool_choice%"=="%%I" (
        echo Running tool: !tool%%I!
        start "" "!tool%%I!"
        pause
        goto open_tools
    )
)

:: If invalid choice
echo Invalid option. Please try again.
pause
goto open_tools

:: Open Other Apps
:open_other
cls
echo ============================
echo          Other Apps
echo ============================
setlocal enabledelayedexpansion
set /a count=0

:: Check if the Other folder exists
if not exist "%other_folder%" (
    echo No Other apps folder found! Returning to the main menu...
    pause
    goto main_menu
)

:: List available apps in the Other folder
for %%A in ("%other_folder%\*.bat") do (
    set /a count+=1
    echo [!count!] %%~nA
    set "tool!count!=%%A"
)

:: Prompt user for selection
set /a count+=1
echo [!count!] Back to Main Menu
set /p tool_choice="Select an app to open: "

if "%tool_choice%"=="%count%" goto main_menu

:: Run the selected app
for /L %%I in (1,1,%count%-1) do (
    if "%tool_choice%"=="%%I" (
        echo Running app: !tool%%I!
        start "" "!tool%%I!"
        pause
        goto open_other
    )
)

:: If invalid choice
echo Invalid option. Please try again.
pause
goto open_other
