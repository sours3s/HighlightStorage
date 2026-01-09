@echo off
cd /d "%~dp0"
echo Launching Highlight...

:: Просто запускаем Java с аргументами, которые подготовил лаунчер
:: Это обходит все ограничения Windows на длину строк и пробелы
java @args.txt

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Game crashed! Code: %ERRORLEVEL%
    pause
)
