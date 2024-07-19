@echo off
echo.
echo =====================================
echo Temporary Solution for CrowdStrike Outage
echo =====================================
echo.

rem Check if running in Safe Mode
reg query "HKLM\SYSTEM\CurrentControlSet\Control\SafeBoot\Option" /v OptionValue
if %ERRORLEVEL% NEQ 0 (
    echo This script must be run in Safe Mode or Windows Recovery Environment.
    pause
    exit /b
)

rem Delete the file
set filepath=C:\Windows\System32\drivers\CrowdStrike\C-00000291*.sys
if exist %filepath% (
    echo Deleting file %filepath%
    del /f /q %filepath%
    echo File deleted.
) else (
    echo File %filepath% not found.
)

rem Reboot the system
echo Rebooting the system...
shutdown /r /t 0
