@echo off
setlocal enabledelayedexpansion

:: 1. ПУТИ
set "ROOT=C:\Highlight\minecraft"
set "LIBS=%ROOT%\libraries"
set "VERSIONS=%ROOT%\versions"
set "ARG_FILE=%ROOT%\classpath.args"

:: 2. СОЗДАЁМ ФАЙЛ АРГУМЕНТОВ (Чтобы обойти лимит длины строки)
echo -cp > "%ARG_FILE%"

:: Собираем все библиотеки в файл по одной
set "TEMP_CP="
for /r "%LIBS%" %%i in (*.jar) do (
    set "TEMP_CP=!TEMP_CP!%%i;"
    :: Каждые 1000 символов сбрасываем в файл, чтобы не переполнить переменную в батнике
    if len !TEMP_CP! GTR 1000 (
        <nul set /p ="!TEMP_CP!" >> "%ARG_FILE%"
        set "TEMP_CP="
    )
)

:: Добавляем версию игры и твой чит
for /r "%VERSIONS%" %%f in (*.jar) do (set "TEMP_CP=!TEMP_CP!%%f;")
set "TEMP_CP=!TEMP_CP!%ROOT%\mods\highlight.jar"
<nul set /p ="!TEMP_CP!" >> "%ARG_FILE%"

:: 3. ЗАПУСК ЧЕРЕЗ @-ФАЙЛ
echo Launching Highlight...
java -Xmx2G @%ARG_FILE% net.fabricmc.loader.impl.launch.knot.KnotClient --username HighlightUser --version 1.21.4 --gameDir "%ROOT%" --assetsDir "%ROOT%\assets" --assetIndex 1.21.4 --uuid 0 --accessToken 0

pause
