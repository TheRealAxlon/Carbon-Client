:Other
cls
echo ============================
echo          Other
echo ============================

:: Ensure the Api folder exists
set "api_folder=%USERPROFILE%\Documents\CARBON\Source\Api"
if not exist "%api_folder%" mkdir "%api_folder%"

:: Download and prepare the other loader (oloder.bat) in the Api folder
echo Downloading other list...
set "other_list_link=https://raw.githubusercontent.com/TheRealAxlon/Carbon-Client/refs/heads/main/Apps/Otherr/List.txt"
curl -s "%other_list_link%" -o "%api_folder%\other_list.txt"

:: Check if the other list is downloaded
if not exist "%api_folder%\other_list.txt" (
    echo Failed to fetch other apps. Returning to Main Menu.
    pause
    goto start
)

:: Create oloder.bat in the Api folder to handle other apps
echo echo Running Other Apps Loader... > "%api_folder%\oloder.bat"
echo for /f "tokens=1,* delims=;" %%A in ('type "%api_folder%\other_list.txt"') do ( >> "%api_folder%\oloder.bat"
echo     start "" "%%B" >> "%api_folder%\oloder.bat"
echo ) >> "%api_folder%\oloder.bat"

:: Run the other loader (oloder.bat)
start "" "%api_folder%\oloder.bat"
pause
goto start
