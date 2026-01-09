@echo off
:: Устанавливаем кодировку UTF-8 для читаемых логов
chcp 65001 >nul
setlocal enabledelayedexpansion

:: 1. ПУТИ
set "ROOT=C:\Highlight\minecraft"
set "LIBS=%ROOT%\libraries"
set "VERSIONS=%ROOT%\versions"

:: 2. СОБИРАЕМ ВСЕ БИБЛИОТЕКИ (Включая твой ASM 9.8)
set "FULL_CP="
for /r "%LIBS%" %%i in (*.jar) do (
    set "FULL_CP=!FULL_CP!%%i;"
)

:: 3. НАХОДИМ ФАЙЛ ИГРЫ В VERSIONS
for /r "%VERSIONS%" %%f in (*.jar) do set "GAME_JAR=%%f"

:: 4. ЗАПУСК КЛИЕНТА
echo [Highlight] Запуск игры...
java -Xmx2G -cp "%FULL_CP%%GAME_JAR%;%ROOT%\mods\highlight.jar" net.fabricmc.loader.impl.launch.knot.KnotClient --username HighlightUser --version 1.21.4 --gameDir "%ROOT%" --assetsDir "%ROOT%\assets" --assetIndex 1.21.4 --uuid 0 --accessToken 0

if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [!] Произошла ошибка при запуске. 
    echo [!] Убедитесь, что у вас установлена Java 21.
    pause
)
