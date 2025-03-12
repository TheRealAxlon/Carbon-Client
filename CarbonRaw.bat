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
set "open_adds_file=%base_folder%\Source\API\aloder.bat"

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
if "%choice%"=="2" goto open_tools
if "%choice%"=="3" goto Download
if "%choice%"=="4" goto adds
if "%choice%"=="5" exit
if /i "%choice%"=="DEV0" goto developer_settings

:: Open Tools
:open_tools
cls
echo ============================
echo        Open Tools
echo ============================
if exist "%open_apps_file%" (
    call "%open_apps_file%"
) else (
    echo Error: tloder.bat not found!
    pause
)
goto start

:: Open Tools
:open_adds
cls
echo ============================
echo        Open Addons
echo ============================
if exist "%open_adds_file%" (
    call "%open_adds_file%"
) else (
    echo Error: aloader.bat not found!
    pause
)
goto start






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



:Download
cls
echo ============================
echo     Download Carbon Apps
echo ============================
echo [1] Tools Apps
echo [2] Other Apps
echo [3] Menu
echo ============================
set /p menu_choice="Select an option: "

if "%menu_choice%"=="1" goto Download_Tools
if "%menu_choice%"=="2" goto Download_Other
if "%menu_choice%"=="3" goto Start


:: Handle invalid input in Main Menu
echo Invalid choice. Please try again.
pause
goto Download



:Other
cls
echo ============================
echo          Other
echo ============================

:: List available items in "Other"
setlocal enabledelayedexpansion
set /a count=0
for %%A in ("%other_folder%\*.bat") do (
    set /a count+=1
    echo [!count!] %%~nA
    set "tool!count!=%%A"
)

:: Add option to return to the main menu
set /a count+=1
echo [!count!] Back to Main Menu

:: Prompt user for choice
set /p tool_choice="Select an option: "
if "!tool_choice!"=="%count%" goto start

:: Run the selected tool
for /L %%I in (1,1,%count%-1) do (
    if "!tool_choice!"=="%%I" (
        echo Running item: !tool%%I!
        call "!tool%%I!"
        pause
        goto Other
    )
)

:: Invalid option handling
echo Invalid option. Please try again.
pause
goto Other



:Tools
cls
echo ============================
echo          Tools
echo ============================

:: List available tools
setlocal enabledelayedexpansion
set /a count=0
for %%A in ("%tools_folder%\*.bat") do (
    set /a count+=1
    echo [!count!] %%~nA
    set "tool!count!=%%A"
)

:: Add option to return to the main menu
set /a count+=1
echo [!count!] Back to Main Menu

:: Prompt user for choice
set /p tool_choice="Select an option: "
if "!tool_choice!"=="%count%" goto start

:: Run the selected tool
for /L %%I in (1,1,%count%-1) do (
    if "!tool_choice!"=="%%I" (
        echo Running tool: !tool%%I!
        call "!tool%%I!"
        pause
        goto Tools
    )
)

:: Invalid option handling
echo Invalid option. Please try again.
pause
goto Tools









:Download_Tools
cls
echo ============================
echo        Download Tools
echo ============================

:: Define folder paths
set "temp_folder=%USERPROFILE%\Documents\CARBON\Data\Temp\DLnames"
set "github_list_link=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/Apps/Tools/List.txt"

:: Ensure necessary folders exist
if not exist "%temp_folder%" mkdir "%temp_folder%"

:: Download tools list quietly
curl -s "%github_list_link%" -o "%temp_folder%\tools_list.txt"

:: Check if list file exists
if not exist "%temp_folder%\tools_list.txt" (
    echo Failed to fetch the tools list. Returning to Main Menu.
    pause
    goto start
)

:: Display available tools for download
echo Select a tool to download:
echo ============================
set /a download_tool_count=0
setlocal enabledelayedexpansion
for /f "tokens=1,* delims=;" %%A in ('type "%temp_folder%\tools_list.txt"') do (
    set /a download_tool_count+=1
    set "download_tool_name!download_tool_count!=%%A"
    set "download_tool_url!download_tool_count!=%%B"
    echo [!download_tool_count!] %%A
)

:: Prompt user to select a tool to download
echo.
set /p download_choice="Enter the number of the tool to download or press Enter to go back: "
if "%download_choice%"=="" goto Tools

:: Process the selected tool
for /L %%I in (1,1,%download_tool_count%) do (
    if "!download_choice!"=="%%I" (
        set "tool_name=!download_tool_name%%I!"
        set "tool_url=!download_tool_url%%I!"
        echo Downloading tool: !tool_name!
        curl -s "!tool_url!" -o "%tools_folder%\!tool_name!.bat"
        if exist "%tools_folder%\!tool_name!.bat" (
            echo Tool downloaded successfully: !tool_name!
        ) else (
            echo Failed to download tool: !tool_name!. Please check the URL or your internet connection.
        )
        pause
        goto Download
    )
)

:Download_Other
cls
echo ============================
echo        Download Other
echo ============================

:: Define folder paths
set "temp_folder=%USERPROFILE%\Documents\CARBON\Data\Temp\DLnames"
set "github_list_link=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/Apps/Otherr/List.txt"

:: Ensure necessary folders exist
if not exist "%temp_folder%" mkdir "%temp_folder%"
if not exist "%other_folder%" mkdir "%other_folder%"

:: Download tools list quietly
curl -s "%github_list_link%" -o "%temp_folder%\tools_list.txt"

:: Check if list file exists
if not exist "%temp_folder%\tools_list.txt" (
    echo Failed to fetch the Other list. Returning to Main Menu.
    pause
    goto start
)

:: Display available tools for download
echo Select a tool to download:
echo ============================
set /a download_tool_count=0
setlocal enabledelayedexpansion
for /f "tokens=1,* delims=;" %%A in ('type "%temp_folder%\tools_list.txt"') do (
    set /a download_tool_count+=1
    set "download_tool_name!download_tool_count!=%%A"
    set "download_tool_url!download_tool_count!=%%B"
    echo [!download_tool_count!] %%A
)

:: Prompt user to select a tool to download
echo.
set /p download_choice="Enter the number of the tool to download or press Enter to go back: "
if "%download_choice%"=="" goto Tools

:: Process the selected tool
for /L %%I in (1,1,%download_tool_count%) do (
    if "!download_choice!"=="%%I" (
        set "tool_name=!download_tool_name%%I!"
        set "tool_url=!download_tool_url%%I!"
        echo Downloading tool: !tool_name!
        curl -s "!tool_url!" -o "%other_folder%\!tool_name!.bat"
        if exist "%other_folder%\!tool_name!.bat" (
            echo Tool downloaded successfully: !tool_name!
        ) else (
            echo Failed to download tool: !tool_name!. Please check the URL or your internet connection.
        )
        pause
        goto Download_Other
    )
)

echo Invalid choice. Please try again.
pause
goto Download









:: ////////////////////////////////////////////////////////////////////////////



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

