@echo off
setlocal enabledelayedexpansion enableextensions
cd %~dp0
set gpf_file=
for %%x in (%~dp0*.gpf) do set gpf_file=!gpf_file! %%x
set gpf_file=%gpf_file:~1%
echo ***************************************************************
echo script prepared by L.karthikeyan M.Pharm., COP, MMC, CHENNAI-03
echo version 2.0
echo ***************************************************************


autogrid4.exe -p %gpf_file% -l grid.glg &

pause