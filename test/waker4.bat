@echo off
call .data/.venv/Scripts/activate
python -m pip install tweepy
pause >nul
python -m pip freeze|xargs python -m pip uninstall -y
pause >nul