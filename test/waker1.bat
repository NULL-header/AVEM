@echo off

setlocal enabledelayedexpansion
set lf=^


REM kakunin
echo a\na
echo -e a
echo -e "a"
echo a%lf%a
echo.
echo a!lf!a
echo.

echo a >test1.txt
echo b >>test1.txt
pause >nul