@echo off
set "ROOT=C:\Highlight\minecraft"
set "VERSIONS=%ROOT%\versions"
set "LIBS=%ROOT%\libraries"

:: 1. Находим основной JAR игры в папке versions
for /r "%VERSIONS%" %%f in (*.jar) do set "GAME_JAR=%%f"

:: 2. Находим JAR загрузчика Fabric в библиотеках ( KnotClient находится в нем)
for /r "%LIBS%" %%f in (*fabric-loader*.jar) do set "LOADER_JAR=%%f"

:: 3. Запуск игры с объединением путей
:: Мы добавляем LOADER_JAR, GAME_JAR и твой чит highlight.jar в один classpath
java -Xmx2G -cp "%LOADER_JAR%;%GAME_JAR%;%ROOT%\mods\highlight.jar" net.fabricmc.loader.impl.launch.knot.KnotClient --username HighlightUser --version 1.21.4 --gameDir "%ROOT%" --assetsDir "%ROOT%\assets" --assetIndex 1.21.4 --uuid 0 --accessToken 0

if %ERRORLEVEL% NEQ 0 (
    echo Ошибка запуска! Проверьте, что все библиотеки скачались в C:\Highlight\minecraft
    pause
)
