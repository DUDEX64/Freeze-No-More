@echo off
title Freeze No More - UNINSTALL
if /i not "%cd%" == "C:\Windows\System32" (
	echo Error: This program must be ran as administator .
	echo To do so, right click on this file and Select "Run as Administrator"
	echo.
	pause
	exit /b 5
)
choice /c yn /m "Are you sure you want to remove Freeze No More"
if "%ERRORLEVEL%" == "2" (
	exit /b 0
)
taskkill /f /im antifreeze.exe
del /Q /S "C:\Program Files\Antifreeze"
del /Q "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup\nofreeze.cmd"
del /Q /S "%homepath%\Downloads\antifreeze.exe"
echo.
echo Any errors listed above should be posted on the GitHub(R) Issues Page.
pause
exit /b 0
