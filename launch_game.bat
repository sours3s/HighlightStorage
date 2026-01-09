@echo off
setlocal enabledelayedexpansion

:: 1. ПУТИ
set "ROOT=C:\Highlight\minecraft"
set "LIBS=%ROOT%\libraries"
set "VERSIONS=%ROOT%\versions"

:: 2. СОБИРАЕМ ВСЕ БИБЛИОТЕКИ В ОДНУ СТРОКУ (Classpath)
:: Этот цикл проходит по всем подпапкам и добавляет каждый JAR через точку с запятой
set "FULL_CP="
for /r "%LIBS%" %%i in (*.jar) do (
    set "FULL_CP=!FULL_CP!;%%i"
)

:: 3. НАХОДИМ JAR ИГРЫ
for /r "%VERSIONS%" %%f in (*.jar) do set "GAME_JAR=%%f"

:: 4. ЗАПУСК
:: Теперь в -cp мы передаем ВСЕ найденные библиотеки (!FULL_CP!)
java -Xmx2G -cp "!FULL_CP!;%GAME_JAR%;%ROOT%\mods\highlight.jar" net.fabricmc.loader.impl.launch.knot.KnotClient --username HighlightUser --version 1.21.4 --gameDir "%ROOT%" --assetsDir "%ROOT%\assets" --assetIndex 1.21.4 --uuid 0 --accessToken 0

if %ERRORLEVEL% NEQ 0 (
    echo Ошибка запуска! Проверьте консоль.
    pause
)
