@echo off
mode 80, 28
title CARBON
chcp 65001 >nul
cls

:: Check if the CARBON folder exists in Documents, if not, create it
set "folder=%USERPROFILE%\Documents\CARBON"
set "foldero=%USERPROFILE%\Documents\CARBON\Pref"
set "addons_folder=%folder%\Addons"
if not exist "%folder%" mkdir "%folder%"
if not exist "%foldero%" mkdir "%foldero%"
if not exist "%addons_folder%" mkdir "%addons_folder%"

set "color_file=%foldero%\theme.txt"
if exist "%color_file%" (
    for /f "delims=" %%A in (%color_file%) do set "theme_color=%%A"
) else (
    set "theme_color=08" :: Default color if no theme is saved
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
echo     #═╦═══════»  [Settings]  [1]
echo       ╚═╦══════»  [Tools]     [2]
echo         ╚═╦═════»   [Fun]      [3]
echo           ╚═╦═════»  [Addons]   [4]
echo             ╚═╦═════» [Exit]     [5]
echo ----------------------------
set /p choice="Select an option: "
if "%choice%"=="1" goto settings
if "%choice%"=="2" goto tools
if "%choice%"=="3" goto fun
if "%choice%"=="4" goto addons
if "%choice%"=="5" exit
if /i "%choice%"=="DEV0" goto developer_settings

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

:fun
cls
echo ============================
echo          Fun
echo ============================
ping localhost -n 2 >nul
echo     #═╦═══════»  [Soundboard] Beta [1]
ping localhost -n 1 >nul
echo       ╚═╦══════»  [Play Movie]     [2]
ping localhost -n 1 >nul
echo         ╚═╦═════»  [Back]          [3]
ping localhost -n 1 >nul
echo ----------------------------
set /p settings_choice="Select an option: "
if "%settings_choice%"=="1" goto Soundboard
if "%settings_choice%"=="2" goto Movie
if "%settings_choice%"=="3" goto start

:addons
cls
echo ============================
echo          Addons
echo ============================


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
if "!addon_choice!"=="%count%" goto start
if "!addon_choice!"=="%count%-1" (
    echo Opening Addons folder...
    start "" "%addons_folder%"
    pause
    goto addons
)

:: Run the selected addon
for /L %%I in (1,1,%count%-2) do (
    if "!addon_choice!"=="%%I" (
        echo Running addon: !addon%%I!
        call "!addon%%I!"
        pause
        goto addons
    )
)

:: Invalid option handling
echo Invalid option. Please try again.
pause
goto addons


:clear_temp
cls
echo ============================
echo        Clear Temp Folder
cls
echo ============================
echo This will delete all files and subfolders in your temp folder.
echo -----------------------------------------
echo Temp Folder: %TEMP%
echo -----------------------------------------
set /p confirm="Do you want to proceed? (y/n): "
if /i "%confirm%"=="y" (
    echo Deleting files in %TEMP%...
    rd /s /q "%TEMP%"
    mkdir "%TEMP%" :: Recreate the temp folder
    echo Temp folder cleared successfully.
    pause
    goto main
) else (
    echo Operation cancelled.
    pause
    goto main
)


:movie
cls
echo ============================
echo          Movie Mode
cls
echo ============================
echo Connecting to watch.ascii.theater...
echo -----------------------------------------
echo Ensure you have SSH installed and set up properly.
echo -----------------------------------------
pause

:: Run the SSH command
ssh -o StrictHostKeyChecking=no watch.ascii.theater

echo -----------------------------------------
echo Movie playback ended. Returning to main menu.
pause
goto main



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
echo       ╚═╦══════»  [Clear Temp]          [2]
ping localhost -n 1 >nul
echo       ╚═╦══════»  [Back]                 [3]
echo ----------------------------
set /p pc_choice="Select an option: "
if "%pc_choice%"=="1" goto change_time_format
if "%pc_choice%"=="2" goto clear_temp
if "%pc_choice%"=="3" goto settings

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
echo [5] Carbon
echo ----------------------------
set /p color_choice="Enter the number for the color: "

:: Set the color based on the user's choice
if "%color_choice%"=="1" set "theme_color=04"
if "%color_choice%"=="2" set "theme_color=02"
if "%color_choice%"=="3" set "theme_color=01"
if "%color_choice%"=="4" set "theme_color=0E"
if "%color_choice%"=="5" set "theme_color=8"

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

:developer_settings
cls
echo ============================
echo      Carbon Developer Settings
echo ============================
ping localhost -n 2 >nul
echo Type the following commands to access settings:
ping localhost -n 1 >nul
echo [folderdev] Open Carbon Folder
ping localhost -n 1 >nul
echo [collordev] Apply Custom Theme Color
ping localhost -n 1 >nul
echo [versiondev] View Carbon Version
ping localhost -n 1 >nul
echo [backdev] Back to Main Menu
echo ----------------------------
set /p dev_command="Type a command: "

if /i "%dev_command%"=="folderdev" goto folderdev
if /i "%dev_command%"=="collordev" goto collordev
if /i "%dev_command%"=="versiondev" goto versiondev
if /i "%dev_command%"=="backdev" goto start

goto developer_settings

:folderdev
start "" "%folder%"
goto developer_settings

:collordev
cls
echo ============================
echo    Apply Custom Theme Color
echo ============================
echo Enter a 2-digit color code (e.g., 01, 02, etc.):
set /p theme_color="Color Code: "
echo %theme_color% > "%color_file%"
color %theme_color%
goto developer_settings

:versiondev
cls
echo ============================
echo          Carbon Version
echo ============================
echo Carbon State: 
echo Folder Path: %color_file%
echo Theme Color: %theme_color%
pause
goto developer_settings









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


:soundboard
cls
echo ============================
echo        Carbon Soundboard
cls
echo ============================
echo This will allow you to play sounds through your mic.
echo The sounds will be saved in DOCUMENTS/CARBON/Soundboard.
echo -----------------------------------------
echo Downloading sounds, please wait...

:: Set up the directories
set "soundboardDir=%USERPROFILE%\Documents\CARBON\Soundboard"
if not exist "%soundboardDir%" mkdir "%soundboardDir%"

:: URLs for the sound files
set "sound1=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/main/Sounds/caramell.mp3"
set "sound2=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/main/Sounds/F!EN.mp3"

:: Download sounds
curl -o "%soundboardDir%\caramell.mp3" %sound1%
curl -o "%soundboardDir%\F!EN.mp3" %sound2%
echo Sounds downloaded and saved in "%soundboardDir%".
pause

:soundboard
cls
echo ============================
echo        Carbon Soundboard
cls              Beta
echo ============================
echo This will allow you to play sounds through your current microphone.
echo The sounds will be saved in DOCUMENTS/CARBON/Soundboard.
echo -----------------------------------------
echo Downloading sounds, please wait...

:: Set up the directories
set "soundboardDir=%USERPROFILE%\Documents\CARBON\Soundboard"
if not exist "%soundboardDir%" mkdir "%soundboardDir%"

:: URLs for the sound files
set "sound1=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/main/Sounds/caramell.mp3"
set "sound2=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/main/Sounds/F!EN.mp3"

:: Download sounds
curl -o "%soundboardDir%\caramell.mp3" %sound1%
curl -o "%soundboardDir%\F!EN.mp3" %sound2%
echo Sounds downloaded and saved in "%soundboardDir%".
pause

:menu
cls
echo ============================
echo    Soundboard Menu Experemental
echo ============================
echo 1. Play Caramell
echo 2. Play F!EN
echo 3. Exit
echo ============================
set /p choice="Choose an option (1-3): "

if "%choice%"=="1" (
    call :playSound "%soundboardDir%\caramell.mp3"
) else if "%choice%"=="2" (
    call :playSound "%soundboardDir%\F!EN.mp3"
) else if "%choice%"=="3" (
    echo Exiting Soundboard...
    exit
) else (
    echo Invalid choice. Try again.
    pause
    goto menu
)

:playSound
cls
if not exist "%~1" (
    echo Error: File not found - "%~1"
    pause
    goto menu
)

echo Playing %~1 through your default media player...
start wmplayer "%~1"
pause
goto menu








