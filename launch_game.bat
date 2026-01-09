@echo off
cd /d "%~dp0"
echo Launching Highlight...

:: Запускаем Java с настройками из файла, который создаст лаунчер
java @args.txt

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Game crashed! Code: %ERRORLEVEL%
    pause
)
