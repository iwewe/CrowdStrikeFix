# CrowdStrikeFix

This repository contains a BAT script to temporarily resolve the CrowdStrike outage issue by deleting a specific file and rebooting the system.

## Instructions

### 1. Download the Script
- **From GitHub:**
  - Click the `Download` button to download the `CrowdStrikeFix.bat` file to your local machine.
- **From USB Drive:**
  - Insert the USB drive containing the `CrowdStrikeFix.bat` file into your computer.
  - Copy the `CrowdStrikeFix.bat` file from the USB drive to your local machine.

### 2. Boot into Safe Mode or Windows Recovery Environment
- **Safe Mode:**
  - Restart your computer.
  - As it restarts, press `F8` repeatedly until the Advanced Boot Options menu appears.
  - Use the arrow keys to select `Safe Mode` and press `Enter`.
- **Windows Recovery Environment:**
  - Restart your computer.
  - When the Windows logo appears, hold the power button for 10 seconds to turn off the computer.
  - Press the power button to turn the computer back on.
  - When the Windows logo appears, hold the power button for 10 seconds again.
  - Repeat the process one more time.
  - This will trigger the Windows Recovery Environment.
  - Select `Troubleshoot` > `Advanced options` > `Startup Settings` > `Restart`.
  - Press `F4` to boot into Safe Mode.

### 3. Run the BAT Script
- Right-click the downloaded or copied `CrowdStrikeFix.bat` file and select `Run as administrator` to ensure it has the necessary permissions to delete the file and reboot the system.

## BAT Script

```bat
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
