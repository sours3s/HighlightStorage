@echo off
set "ROOT=C:\Highlight\minecraft"
set "LIBS=%ROOT%\libraries"
:: Укажи название своей папки из versions
set "GAME_JAR=%ROOT%\versions\1.21.4-fabric\1.21.4-fabric.jar"

:: Запуск игры
java -Xmx2G -cp "%GAME_JAR%;%LIBS%\*;%ROOT%\mods\highlight.jar" net.fabricmc.loader.impl.launch.knot.KnotClient --username HighlightUser --version 1.21.4 --gameDir "%ROOT%" --assetsDir "%ROOT%\assets" --assetIndex 1.21.4 --uuid 0 --accessToken 0
pause
