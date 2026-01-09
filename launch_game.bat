@echo off
cd /d "%~dp0"
echo Launching Highlight...

:: Вся магия теперь внутри файла args.txt, который создает лаунчер
java @args.txt

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Game crashed! Code: %ERRORLEVEL%
    pause
)
