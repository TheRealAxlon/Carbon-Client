@echo off
title CARBON v1.1.3

:: Verify the loader's validation key
set "carbon_temp_file=%temp%\carbon_loader.tmp"

if not exist "%carbon_temp_file%" (
    echo ERROR: This program must be run through the official loader.
    pause
    exit
)

:: Read the key from the temp file
set /p carbon_key=<"%carbon_temp_file%"

:: Check if the key matches the expected value
if not "%carbon_key%"=="UNIQUE-LOADER-KEY" (
    echo ERROR: Validation failed. This program must be run through the official loader.
    pause
    exit
)

:: Clean up the temp file
del "%carbon_temp_file%" >nul 2>&1

:: Proceed with the rest of the script
mode 80, 28
chcp 65001 >nul
cls

:: Your Carbon script continues here...
echo Welcome to Carbon!
pause


:: Check if the CARBON folder exists in Documents, if not, create it
set "folder=%USERPROFILE%\Documents\CARBON"
if not exist "%folder%" mkdir "%folder%"

:: Load saved theme settings if they exist
set "color_file=%folder%\theme.txt"
if exist "%color_file%" (
    for /f "delims=" %%A in (%color_file%) do set "theme_color=%%A"
) else (
    set "theme_color=05" :: Default color if no theme is saved
)

:: Load time format settings if they exist
set "time_format_file=%folder%\time_format.txt"
if exist "%time_format_file%" (
    for /f "delims=" %%A in (%time_format_file%) do set "time_format=%%A"
) else (
    set "time_format=12" :: Default time format
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
echo         Carbon v1.1.3
echo ============================
echo      Erm what the sigma 
echo ============================
ping localhost -n 2 >nul
echo     #═╦═══════»  [Settings]  [1]
ping localhost -n 1 >nul
echo       ╚═╦══════»  [Tools]     [2]
ping localhost -n 1 >nul
echo         ╚═╦═════»  [Exit]      [3]
ping localhost -n 1 >nul
echo ----------------------------
set /p choice="Select an option: "
if "%choice%"=="1" goto settings
if "%choice%"=="2" goto tools
if "%choice%"=="3" exit

:settings
cls
echo ============================
echo          Settings
echo ============================
ping localhost -n 2 >nul
echo     #═╦═══════»  [Carbon Settings]  [1]
ping localhost -n 1 >nul
echo       ╚═╦══════»  [PC Settings]     [2]
ping localhost -n 1 >nul
echo         ╚═╦═════»  [Back]           [3]
ping localhost -n 1 >nul
echo ----------------------------
set /p settings_choice="Select an option: "
if "%settings_choice%"=="1" goto carbon_settings
if "%settings_choice%"=="2" goto pc_settings
if "%settings_choice%"=="3" goto start

:carbon_settings
cls
echo ============================
echo       Carbon Settings
echo ============================
ping localhost -n 2 >nul
echo     #═╦═══════»  [Change Theme]  [1]
ping localhost -n 1 >nul
echo       ╚═╦══════»  [Uninstall Carbon] [2]
ping localhost -n 1 >nul
echo         ╚═╦═════»  [Back]           [3]
ping localhost -n 1 >nul
echo ----------------------------
set /p carbon_choice="Select an option: "
if "%carbon_choice%"=="1" goto change_theme
if "%carbon_choice%"=="2" goto uninstall
if "%carbon_choice%"=="3" goto settings

:pc_settings
cls
echo ============================
echo         PC Settings
echo ============================
ping localhost -n 2 >nul
echo     #═╦═══════»  [Change Time Format]  [1]
ping localhost -n 1 >nul
echo       ╚═╦══════»  [Back]              [2]
ping localhost -n 1 >nul
echo ----------------------------
set /p pc_choice="Select an option: "
if "%pc_choice%"=="1" goto change_time_format
if "%pc_choice%"=="2" goto settings

:change_time_format
cls
echo ============================
echo     Change Time Format
echo ============================
echo Current Time Format: %time_format%-hour
ping localhost -n 1 >nul
echo [1] Switch to 12-hour format
ping localhost -n 1 >nul
echo [2] Switch to 24-hour format 
ping localhost -n 1 >nul
echo ----------------------------
set /p time_choice="Select an option: "
if "%time_choice%"=="1" (
    set "time_format=12"
    echo 12 > "%time_format_file%"
    powershell -Command "$wshell = New-Object -ComObject WScript.Shell; $wshell.Popup('Time Format Set to 12-hour format', 0, 'Time Format', 0x0)"
)
if "%time_choice%"=="2" (
    set "time_format=24"
    echo 24 > "%time_format_file%"
    powershell -Command "$wshell = New-Object -ComObject WScript.Shell; $wshell.Popup('Time Format Set to 24-hour format', 0, 'Time Format', 0x0)"
)
pause
goto pc_settings

:change_theme
cls
echo ============================
echo        Change Theme
echo ============================
ping localhost -n 2 >nul
echo Choose a color:
echo [1] Red
ping localhost -n 1 >nul
echo [2] Green
ping localhost -n 1 >nul
echo [3] Blue
ping localhost -n 1 >nul
echo [4] Yellow
ping localhost -n 1 >nul
echo [5] Magenta
echo ----------------------------
set /p color_choice="Enter the number for the color: "

:: Set the color based on the user's choice
if "%color_choice%"=="1" set "theme_color=04"
if "%color_choice%"=="2" set "theme_color=02"
if "%color_choice%"=="3" set "theme_color=01"
if "%color_choice%"=="4" set "theme_color=0E"
if "%color_choice%"=="5" set "theme_color=05"

:: Save the new theme color in a text file
echo %theme_color% > "%color_file%"

:: Apply the new color
powershell -Command "$wshell = New-Object -ComObject WScript.Shell; $wshell.Popup('Theme color updated successfully', 0, 'Theme Changed', 0x0)"
color %theme_color%
goto carbon_settings

:uninstall
cls
echo ============================
echo        Uninstall Carbon
echo ============================
echo This will delete the CARBON folder from Documents.
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

:tools
cls
echo ============================
echo          Tools
echo ============================
ping localhost -n 1 >nul
echo [1] Steam VR
ping localhost -n 1 >nul
echo [2] Go to BIOS/OBBs
ping localhost -n 1 >nul
echo [3] Timed Shutdown
ping localhost -n 1 >nul
echo [4] Back
echo ----------------------------
set /p tool_choice="Select a tool: "
if "%tool_choice%"=="1" goto steam_vr
if "%tool_choice%"=="2" goto bios
if "%tool_choice%"=="3" goto timed_shutdown
if "%tool_choice%"=="4" goto start

:steam_vr
cls
echo ============================
echo       Launch Steam VR
echo ============================
ping localhost -n 1 >nul
echo Opening Steam VR...
start steam://rungameid/250820
ping localhost -n 2 >nul
pause
goto tools

:bios
cls
echo ============================
echo        Go to BIOS/OBBs
cls
echo ============================
echo This will restart your computer and enter the BIOS/UEFI settings.
echo Please save all your work before proceeding.
echo -----------------------------------------
set /p confirm="Do you want to continue? (y/n): "
if /i "%confirm%"=="y" (
    echo Restarting to BIOS...
    shutdown /r /fw /t 0
    exit
) else (
    echo Operation cancelled.
    pause
    goto tools
)

:timed_shutdown
cls
echo ============================
echo       Timed Shutdown
cls
echo ============================
echo Enter the time in seconds for the shutdown:
set /p shutdown_time="Time (in seconds): "
if "%shutdown_time%" NEQ "" (
    powershell -Command "$wshell = New-Object -ComObject WScript.Shell; $wshell.Popup('Your system will shut down in %shutdown_time% seconds', 0, 'Timed Shutdown', 0x0)"
    shutdown -s -t %shutdown_time%
    echo Shutdown scheduled in %shutdown_time% seconds.
) else (
    echo Invalid input. No shutdown scheduled.
)
pause
goto tools
