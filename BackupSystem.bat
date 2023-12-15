@echo off
title Backup System
color 97
mode con cols=98 lines=30
set dbName=databaseNameHere
REM 10 chars
set todayTime=%DATE:~10,4%-%DATE:~4,2%-%DATE:~7,2%-%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%

echo:
echo:
echo                   _______________________________________________________________
echo                  ^|                                                               ^| 
echo                  ^|                                                               ^|
echo                  ^|      Welcome to Backup System                                 ^|
echo                  ^|      ___________________________________________________      ^|
echo                  ^|                                                               ^|
echo                  ^|      [1] Backup                                               ^|
echo                  ^|      [2] Restore Backup                                       ^|
echo                  ^|      [3] Cancel                                               ^|
echo                  ^|      ___________________________________________________      ^|
echo                  ^|                                                               ^|
echo                  ^|      Powered by {Your Company}                                ^|
echo                  ^|                                                               ^|
echo                  ^|_______________________________________________________________^|
echo:          
choice /C:123 /N /M ">                   Enter Your Choice in the Keyboard [1,2,3] : "

if errorlevel  3 goto:Exit
if errorlevel  2 goto:Restore
if errorlevel  1 goto:Backup
::============================================================================================

:Backup

cls
title Backup
mode con cols=98 lines=30

set path=D:\wamp64\bin\mariadb\mariadb10.4.10\bin
mysqldump -uroot -p %dbName% > "%dbName%-%todayTime%.sql"

echo:
echo:
echo                   _______________________________________________________________
echo                  ^|                                                               ^| 
echo                  ^|                                                               ^|
echo                  ^|      Backup Succeed                                           ^|
echo                  ^|      [%dbName%-%todayTime%.sql]                     ^|
echo                  ^|      ___________________________________________________      ^|
echo                  ^|                                                               ^|
echo                  ^|      Powered by {Your Company}                                ^|
echo                  ^|                                                               ^|
echo                  ^|_______________________________________________________________^|
echo:          

pause
exit

::============================================================================================
:Restore

cls
title Restore Backup
mode con cols=98 lines=30

if exist %dbName%.sql (
	set path=D:\wamp64\bin\mariadb\mariadb10.4.10\bin
	mysql -u root -p %dbName% < "%dbName%.sql"

	echo:
	echo:
	echo                   _______________________________________________________________
	echo                  ^|                                                               ^| 
	echo                  ^|                                                               ^|
	echo                  ^|      Restore Backup Succeed                                   ^|
	echo                  ^|      [%dbName%.sql]                                       ^|
	echo                  ^|      ___________________________________________________      ^|
	echo                  ^|                                                               ^|
	echo                  ^|      Powered by {Your Company}                                ^|
	echo                  ^|                                                               ^|
	echo                  ^|_______________________________________________________________^|
	echo:          

	pause
	exit
) else (
	echo:
	echo:
	echo                   _______________________________________________________________
	echo                  ^|                                                               ^| 
	echo                  ^|                                                               ^|
	echo                  ^|      Restore Backup Failed                                    ^|
	echo                  ^|      [File %dbName%.sql not found!]                       ^|
	echo                  ^|      ___________________________________________________      ^|
	echo                  ^|                                                               ^|
	echo                  ^|      Powered by {Your Company}                                ^|
	echo                  ^|                                                               ^|
	echo                  ^|_______________________________________________________________^|
	echo:          

	pause
	exit
)

::============================================================================================
:Exit
exit
