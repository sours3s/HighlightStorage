@echo off
setlocal enabledelayedexpansion
set "ROOT=C:\Highlight\minecraft"
set "LIBS=%ROOT%\libraries"
set "VERSIONS=%ROOT%\versions"
set "CP="
for /r "%LIBS%" %%i in (*.jar) do (set "CP=!CP!%%i;")
for /r "%VERSIONS%" %%f in (*.jar) do (set "GAME_JAR=%%f")
echo Launching...
java -Xmx2G -cp "%CP%%GAME_JAR%;%ROOT%\mods\highlight.jar" net.fabricmc.loader.impl.launch.knot.KnotClient --username HighlightUser --version 1.21.4 --gameDir "%ROOT%" --assetsDir "%ROOT%\assets" --assetIndex 1.21.4 --uuid 0 --accessToken 0
pause
