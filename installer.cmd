@echo off
title Freeze No More Installer
rem Program not complete.
echo Miranda Studios (DUDEX64) Freeze No More
echo Copyright (C) 2017 Michael Miranda, all rights reserved.
echo.
rem If we don't have admin, we can't install
rem If we are admin, our working dir will be system32
if /i "%cd%" -NEQ "C:\Windows\System32" (
    echo This program requires administrator privledges.
    echo Please run this program as administrator.
    echo.
    pause
    exit /b 1
)
rem We have admin, we'll now change into the user's download
rem folder to find the antifreeze.exe file, which we will then
rem install or update.
chdir "%homepath%\Downloads"
if not exist "antifreeze.exe" (
    echo Error: Could not find antifreeze.exe in "%homepath%\Downloads"
    echo Cannot Install or Update the program, QUITING.
    echo.
    pause
    exit /b 1
)
echo This program is licenced under the terms of the GNU General
echo Public Licence Version 3, or at your option, any later version.
echo For more details, please see <http://www.gnu.org/licenses/>.
echo.
pause
rem Main installer code here