@echo off
cd %~dp0
autogrid4.exe -p grid.gpf -l grid.glg &
set receptor=2iyq.pdbqt rem change here
echo the receptor file is %receptor%
pause