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

:: Run the selected item
for /L %%I in (1,1,%count%-1) do (
    if "!tool_choice!"=="%%I" (
        echo Running item: !tool%%I!
        start "" "!tool%%I!"  :: Use "start" to open the item in a new process
        pause
        goto Other
    )
)

:: Invalid option handling
echo Invalid option. Please try again.
pause
goto Other
