@echo off
set "ROOT=C:\Highlight\minecraft"
set "LIBS=%ROOT%\libraries"
set "VERSIONS=%ROOT%\versions"

:: Находим первый попавшийся JAR в папке versions (твою версию фабрик)
for /r "%VERSIONS%" %%f in (*.jar) do set "GAME_JAR=%%f"

:: Команда запуска
:: Чит подгружается из папки mods
java -Xmx2G -cp "%GAME_JAR%;%LIBS%\*;%ROOT%\mods\highlight.jar" net.fabricmc.loader.impl.launch.knot.KnotClient --username HighlightUser --version 1.21.4 --gameDir "%ROOT%" --assetsDir "%ROOT%\assets" --assetIndex 1.21.4 --uuid 0 --accessToken 0

if %ERRORLEVEL% NEQ 0 (
    echo Ошибка! Проверьте, установлена ли Java 21.
    pause
)
