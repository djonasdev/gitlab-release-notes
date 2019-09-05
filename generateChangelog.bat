@ECHO OFF
set token=%1
set id=%2
PowerShell.exe -executionpolicy remotesigned -Command ".\generateChangelog.ps1 -token '%token%' -projectID '%id%'"