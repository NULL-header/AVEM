@echo off
if 1 == 1 (
	echo #encoding:utf-8>test\test1.py
	echo.>>test\test1.py
	echo print^(^"hello venv and you!^"^)>>test\test1.py
)
pause >nul