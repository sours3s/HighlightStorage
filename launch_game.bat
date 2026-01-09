@echo off
set "ROOT=C:\Highlight\minecraft"
set "LIBS=%ROOT%\libraries"
set "VERSIONS=%ROOT%\versions"
set "ARG_FILE=%ROOT%\classpath.args"

echo -cp > "%ARG_FILE%"
for /r "%LIBS%" %%i in (*.jar) do (<nul set /p ="^"%%i^";" >> "%ARG_FILE%")
for /r "%VERSIONS%" %%f in (*.jar) do (<nul set /p ="^"%%f^";" >> "%ARG_FILE%")
<nul set /p ="^"%ROOT%\mods\highlight.jar^"" >> "%ARG_FILE%"

echo Launching Highlight...
java -Xmx2G @%ARG_FILE% net.fabricmc.loader.impl.launch.knot.KnotClient --username HighlightUser --version 1.21.4 --gameDir "%ROOT%" --assetsDir "%ROOT%\assets" --assetIndex 1.21.4 --uuid 0 --accessToken 0
pause
