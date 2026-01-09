@echo off
cd /d "%~dp0"
echo [Highlight] Launching via args.txt...

:: Проверка наличия файла аргументов
if not exist args.txt (
    echo [ERROR] args.txt not found! Launcher failed to generate it.
    pause
    exit
)

:: Запуск Java с готовыми аргументами
java @args.txt

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Game crashed with code: %ERRORLEVEL%
    pause
)
