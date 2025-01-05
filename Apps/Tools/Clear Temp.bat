@echo off

:: Ensure the script is in the correct folder
set "tools_folder=%USERPROFILE%\Documents\CARBON\Data\Tools"
set "addon_path=%~dp0"
if /i not "%addon_path:~0,-1%"=="%tools_folder%" (
    echo This script must be placed in the Tools folder.
    pause
    exit /b
)

:clear_temp_menu
cls

echo ============================
echo        Clear Temp Folder
echo ============================
echo This will delete all files and subfolders in your temp folder.
echo -----------------------------------------
echo Temp Folder: %TEMP%
echo -----------------------------------------
echo [1] Clear Temp Folder
echo [2] Back to Tools Menu
echo -----------------------------------------
set /p choice="Select an option: "

if "%choice%"=="1" goto clear_temp
if "%choice%"=="2" goto back_to_tools

:: Handle invalid input
echo Invalid option. Please try again.
pause
goto clear_temp_menu

:clear_temp
cls
echo Clearing Temp Folder: %TEMP%
rd /s /q "%TEMP%" >nul 2>nul
mkdir "%TEMP%" >nul 2>nul
echo Temp folder cleared successfully!
pause
goto clear_temp_menu

:back_to_tools
cls
if exist "%tools_folder%\Source\CARBON_ClientLoad" (
    cd /d "%tools_folder%\Source\CARBON_ClientLoad" >nul 2>nul
)
exit /b
