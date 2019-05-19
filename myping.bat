@echo off
title Ping Tool
SETLOCAL
::Set your favorite color for your cmd. if you wants to use your default cmd color setting so comment next line with ::
color a
::Make a logo
echo       +------------------+
::You can change this line
SET "nick=MR.MMG ping tool"
:: CAUTION: Don't cahnge line 11 to 19
:loop1
IF DEFINED nick IF "%nick:~17,1%" neq "" GOTO shownick
SET "nick=%nick% "
IF "%nick:~17,1%" neq "" GOTO shownick
SET "nick= %nick%"
GOTO loop1
:shownick
echo       ^|%nick%^|  
echo       +------------------+
:start
echo.
set /p uip=Enter IP or URL:
echo.
::Default Answer for all question is "y"
set /p cond1=Unlimited ping(y/n)?
:: ping -t url/ip
IF /I "%cond1%" EQU "y" goto :unlimited
IF /I "%cond1%" EQU "n" goto :limited
echo.
echo.
echo Pinging "%uip%"
:unlimited
echo.
echo.
echo ^| ^* Unlimited Mode ^* ^|
echo.
ping -t %uip%
::if you want to quit press Crtl+C
:limited
set /p cond2=Do you want to enter specific number for requests(y/n)?
:: ping -n count url/ip
IF /I "%cond2%" EQU "y" goto :specific
IF /I "%cond2%" EQU "n" goto :nospecific
:specific
set /p number=enter number of echo requets (only positive number):
echo.
echo.
echo ^| ^* Specific Mode ^* ^|
echo.
ping -n %number% %uip%
pause
set /p cond3=Do you want to exit(y/n)?
IF /I "%cond3%" EQU "y" goto :exit
IF /I "%cond3%" EQU "n" goto :start
:nospecific
:: ping url/ip
echo.
echo.
echo ^| ^* Normal Mode ^* ^|
echo.
ping %uip%
pause
set /p cond4=Do you want to exit(y/n)?
IF /I "%cond4%" EQU "y" goto :exit
IF /I "%cond4%" EQU "n" goto :start
:exit
exit