@echo off
title Miranda Studios - Freeze No More, Installation
rem Program not complete.
echo Miranda Studios (DUDEX64) Freeze No More
echo Copyright (C) 2017 Michael Miranda, all rights reserved.
echo.
rem If we don't have admin, we can't install
rem If we are admin, our working dir will be system32
if /i "%cd%" NEQ "C:\Windows\System32" (
    echo This program requires administrator privledges.
    echo Please run this program as administrator.
    echo.
    pause
    exit /b 1
)
rem We have admin, we'll now change into the user's download
rem folder to find the antifreeze.exe file, which we will then
rem install or update.
if not exist "%homepath%\Downloads\antifreeze.exe" (
    echo Error: Could not find antifreeze.exe in "%homepath%\Downloads"
    echo Cannot Install or Update the program, QUITING.
    echo.
    pause
    explorer "%homepath%"
    exit /b 1
)
echo This program is licenced under the terms of the GNU General
echo Public Licence Version 3, or at your option, any later version.
echo For more details, please see <http://www.gnu.org/licenses/>.
echo.
pause
cls
echo Miranda Studios (DUDEX64) Freeze No More
echo Copyright (C) 2017 Michael Miranda, all rights reserved.
echo.
echo Please wait while the program installs/updates...
set programfile=%homepath%\Downloads\antifreeze.exe
set installdir=C:\Program Files\Antifreeze\
if not exist "%installdir%" (
    mkdir "%installdir%"
)
if "%ERRORLEVEL%" NEQ "0" (
    echo ERROR: Could not make/find install directory.
    goto errorender
)
copy "%programfile%" "%installdir"
if "%ERRORLEVEL%" NEQ "0" (
    echo ERROR: Could not install "%programfile%" into "%installdir%"
    goto errorender
)
chdir "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"
if "%ERRORLEVEL%" NEQ "0" (
    echo ERROR: Could not change into startup folder.
    goto errorender
)
(
    echo @start "NOFREEZE" "%installdir%\antifreeze.exe"
) > nofreeze.cmd
if "%ERRORLEVEL%" NEQ "0" (
    echo ERROR: Could not create startup program to launch antifreeze.exe.
    goto errorender
)
cls
echo Miranda Studios (DUDEX64) Freeze No More
echo Copyright (C) 2017 Michael Miranda, all rights reserved.
echo.
echo Success, Freeze No More was successfully installed on your computer.
echo You will need to restart for the changes to take effect.
echo.
choice /c yn /m "Would you like to restart now"
if "%ERRORLEVEL%" == "1" (
    shutdown /r /t 000
)
exit /b 0
rem Successful Installation


rem Subprogram Section
: errorender
echo.
echo Installation Terminated, See the GitHub Issues Page for help.
pause
exit /b 1
