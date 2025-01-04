@echo off

:: Ensure the addon is in the correct folder
set "required_folder=%USERPROFILE%\Documents\CARBON\Addons"
set "addon_path=%~dp0"
if /i not "%addon_path:~0,-1%"=="%required_folder%" (
    echo This addon must be placed in the "Documents\CARBON\Addons" folder to work.
    pause
    exit /b
)

:cat_menu
cls

echo ============================
echo           Cat
  echo ============================
echo [1] Pet the cat
echo [2] Back to Addons Menu

set /p choice="Select an option: "
if "%choice%"=="1" goto pet_cat
if "%choice%"=="2" goto back_to_addons

:: Handle invalid input
echo Invalid option. Please try again.
pause
goto cat_menu

:pet_cat
cls
echo You pet the cat. It says: Meow!
pause

goto cat_menu


@echo off

:: Ensure the addon is in the correct folder
set "required_folder=%USERPROFILE%\Documents\CARBON\Addons"
set "addon_path=%~dp0"
if /i not "%addon_path:~0,-1%"=="%required_folder%" (
    echo This addon must be placed in the "Documents\CARBON\Addons" folder to work.
    pause
    exit /b
)

:cat_menu
cls

echo ============================
echo           Cat
  echo ============================
echo [1] Pet the cat
echo [2] Back to Addons Menu

set /p choice="Select an option: "
if "%choice%"=="1" goto pet_cat
if "%choice%"=="2" goto back_to_addons

:: Handle invalid input
echo Invalid option. Please try again.
pause
goto cat_menu

:pet_cat
cls
echo You pet the cat. It says: Meow!
pause

goto cat_menu

:back_to_addons
cls
if exist "%USERPROFILE%\Documents\CARBON\Source\CARBON_ClientLoad" (
    cd /d "%USERPROFILE%\Documents\CARBON\Source\CARBON_ClientLoad" >nul 2>nul
)
goto :eof
