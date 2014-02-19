call Config.cmd
@echo off

"%WORK_SPACE%\binary\FontMake.exe" -fwa2 "%DIR_TEMP%\font\t1.txt" "%DIR_TEMP%\font\t1.txt"
copy "%DIR_TEMP%\data.dar_unpacked\ddspkg\02309.pkgdds" "%DIR_TEMP%\font"
move font1.png "%DIR_TEMP%\font\02309.pkgdds_000.png"
move font3.png "%DIR_TEMP%\font\02309.pkgdds_002.png"
..\..\3rd\nvtt\nvcompress.exe -nomips -nocuda -rgb16 "%DIR_TEMP%\font\02309.pkgdds_000.png"
..\..\3rd\nvtt\nvcompress.exe -nomips -nocuda -rgb8 "%DIR_TEMP%\font\02309.pkgdds_002.png"
"%PS3_TOOL%\dds2gtf.exe" "%DIR_TEMP%\font\02309.pkgdds_000.dds"
"%PS3_TOOL%\dds2gtf.exe" "%DIR_TEMP%\font\02309.pkgdds_002.dds"
python import_file.py -ip "%DIR_TEMP%\font\02309.pkgdds"
call compress.bat "%DIR_TEMP%\font\" pkgdds
for /f "delims=" %%i in ("%DIR_TEMP%\font\02309.pkgdds") do (
set lzname=%%~ni
copy "%DIR_TEMP%\font\02309.pkgdds.elzma" "%DIR_OUTPUT%\dar\%lzname:~0,5%.elzma"
)
pause