:Tools
cls
echo ============================
echo          Tools
echo ============================

:: Ensure the Api folder exists
set "api_folder=%USERPROFILE%\Documents\CARBON\Source\Api"
if not exist "%api_folder%" mkdir "%api_folder%"

:: Download and prepare the tools loader (tloder.bat) in the Api folder
echo Downloading tools list...
set "tools_list_link=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/Apps/Tools/List.txt"
curl -s "%tools_list_link%" -o "%api_folder%\tools_list.txt"

:: Check if the tools list is downloaded
if not exist "%api_folder%\tools_list.txt" (
    echo Failed to fetch tools. Returning to Main Menu.
    pause
    goto start
)

:: Create tloder.bat in the Api folder to handle tools
echo echo Running Tools Loader... > "%api_folder%\tloder.bat"
echo for /f "tokens=1,* delims=;" %%A in ('type "%api_folder%\tools_list.txt"') do ( >> "%api_folder%\tloder.bat"
echo     start "" "%%B" >> "%api_folder%\tloder.bat"
echo ) >> "%api_folder%\tloder.bat"

:: Run the tools loader (tloder.bat)
start "" "%api_folder%\tloder.bat"
pause
goto start
