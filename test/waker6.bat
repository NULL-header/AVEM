@echo off

if 1 == 1 (
	pushd .data\.venv\Lib\site-packages
	echo import builtins>usercustomize.py
	echo.>>usercustomize.py
	echo __original = open>usercustomize.py
	echo def __open^(file, mode='r', buffering=-1, encoding=None, errors=None, newline=None, closefd=True, opener=None^):>>usercustomize.py
	echo     if 'b' not in mode and not encoding:>>usercustomize.py
	echo         encoding = 'utf-8'>>usercustomize.py
	echo     return __original^(file, mode, buffering, encoding, errors, newline, closefd, opener^)>>usercustomize.py
	echo.>>usercustomize.py
	echo builtins.open = __open>>usercustomize.py
	popd
)
pause >nul