@echo off

:: Ensure the script is in the correct folder
set "tools_folder=%USERPROFILE%\Documents\CARBON\Data\Tools"
set "addon_path=%~dp0"
if /i not "%addon_path:~0,-1%"=="%tools_folder%" (
    echo This script must be placed in the Tools folder.
    pause
    exit /b
)

:tools_menu
cls
echo ============================
echo       Tools Menu
echo ============================
echo [1] Timed Shutdown
echo [2] Back to Home Menu

set /p choice="Select an option: "
if "%choice%"=="1" goto timed_shutdown
if "%choice%"=="2" goto back_to_home

:: Handle invalid input
echo Invalid option. Please try again.
pause
goto tools_menu

:timed_shutdown
cls
echo ============================
echo       Timed Shutdown
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
goto tools_menu

:back_to_home
cls
echo Returning to the Home Menu...
:: Add your home menu logic here
pause
exit /b
