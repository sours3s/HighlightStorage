@echo off
setlocal enabledelayedexpansion

:: 1. SET PATHS
set "ROOT=C:\Highlight\minecraft"
set "LIBS=%ROOT%\libraries"
set "VERSIONS=%ROOT%\versions"

:: 2. BUILD CLASSPATH (Loop through all jars)
set "FULL_CP="
for /r "%LIBS%" %%i in (*.jar) do (
    set "FULL_CP=!FULL_CP!%%i;"
)

:: 3. FIND GAME JAR
for /r "%VERSIONS%" %%f in (*.jar) do (
    set "GAME_JAR=%%f"
)

:: 4. START GAME
echo Starting Highlight...
java -Xmx2G -cp "%FULL_CP%%GAME_JAR%;%ROOT%\mods\highlight.jar" net.fabricmc.loader.impl.launch.knot.KnotClient --username HighlightUser --version 1.21.4 --gameDir "%ROOT%" --assetsDir "%ROOT%\assets" --assetIndex 1.21.4 --uuid 0 --accessToken 0

if %ERRORLEVEL% NEQ 0 (
    echo Launch failed.
    pause
)
