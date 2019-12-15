@echo off

pushd %~dp0

setlocal
set fold=test
set file=test1.py

if exist .data (
	echo the .data folder exists.
) else (
	echo the .data folder does not exist.
	echo make this.
	md .data
)
if exist doc (
	echo the doc folder exists.
) else (
	echo the doc folder does not exist.
	echo make this.
	md doc
)
if exist test (
	echo the test folder exists.
) else (
	echo the test folder does not exist.
	echo make this.
	md test
)
if exist requirements.txt (
	echo requirements.txt exists.
) else (
	echo. >requirements.txt
	echo requirements.txt does not exist.
	echo made this.
)
if exist ac_venv.bat (
	echo ac_venv.bat exists.
) else (
	echo cmd ^/k .data\.venv\Scripts\activate >ac_venv.bat
	echo ac_venv.bat does not exist.
	echo made this.
)
if exist ac_atom.bat (
	echo ac_atom.bat exists.
) else (
	echo atom . >ac_atom.bat
	echo ac_atom.bat does not exist.
	echo made this.
)


for /f "usebackq delims=" %%i in (`certutil -hashfile requirements.txt MD5 ^| find /v "CertUtil" ^| find /v "MD5"`) do set Hash=%%i
if "%Hash%" == "" (
	set Hash=d41d8cd98f00b204e9800998ecf8427e
)

pushd .data

if exist "ram-%Hash%.txt" (
	echo venv was made.
) else (
	echo venv was not made.
	echo meke this.
	if exist .venv (
		rd /q /s .venv
	)
	del /q ram-*.txt
	echo %Hash% >"ram-%Hash%.txt"
	python -m venv .venv
	call .venv\Scripts\activate.bat & ^
python -m pip install --upgrade pip & ^
if "%Hash%" == "d41d8cd98f00b204e9800998ecf8427e" (
	echo requirements.txt has no item.
) else (
	echo requirements.txt has some imtems.
	python -m pip install -r ..\requirements.txt
) & ^
echo all green. & ^
pause >nul & ^
deactivate
)

call .venv\Scripts\activate.bat & ^
echo all green. & ^
echo. & ^
echo ============================== & ^
echo. & ^
cd .. & ^
cd %fold% & ^
python %file% & ^
echo. & ^
echo ============================== & ^
echo. & ^
echo waker warked. & ^
pause >nul & ^
deactivate