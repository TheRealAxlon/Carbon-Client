@echo off

:: Ensure the script is in the correct Tools folder
set "tools_folder=%USERPROFILE%\Documents\CARBON\Data\Tools"
set "script_path=%~dp0"
if /i not "%script_path:~0,-1%"=="%tools_folder%" (
    echo Unable to run. This script must be placed in the Tools folder.
    pause
    exit /b
)

:movie_menu
cls
echo ============================
echo          Movie Mode
echo ============================
echo [1] Play Movie
echo [2] Go Back to Main Menu
echo -----------------------------------------
set /p choice="Select an option: "

if "%choice%"=="1" goto play_movie
if "%choice%"=="2" goto back_to_tools

:: Handle invalid input
echo Invalid option. Please try again.
pause
goto movie_menu

:play_movie
cls
echo Connecting to watch.ascii.theater...
pause

:: Run the SSH command
ssh -o StrictHostKeyChecking=no watch.ascii.theater

echo -----------------------------------------
echo Movie playback ended. Returning to Movie Mode menu.
pause
goto movie_menu

:back_to_tools
cls
if exist "%tools_folder%\Source\CARBON_ClientLoad" (
    cd /d "%tools_folder%\Source\CARBON_ClientLoad" >nul 2>nul
)
exit /b
