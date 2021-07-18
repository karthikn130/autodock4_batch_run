@echo off
setlocal enabledelayedexpansion enableextensions
set receptor=
for %%x in (%~dp0*.pdbqt) do set receptor=!receptor! %%x
set receptor=%receptor:~1%

set ref_file=
for %%x in (%~dp0*.gpf) do set ref_file=!ref_file! %%x
set ref_file=%ref_file:~1%

set dockingbat=%~dp0docking.bat
set gridmap=%~dp0grid_map.bat
echo ***************************************************************
echo script prepared by L.karthikeyan M.Pharm., COP, MMC, CHENNAI-03
echo version 2.0
echo ***************************************************************

echo the receptor file is %receptor%
echo the gpf reference file is %ref_file%
echo the docking batch file is %dockingbat%
echo the gridmap batch file is %gridmap%

echo are the parameters are correct?
PAUSE


for /d %%a in (%~dp0*) do (
	for %%B in (%%a\*.pdbqt) do (
	C:\autodock\python.exe C:\autodock\Lib\site-packages\AutoDockTools\Utilities24\prepare_dpf4.py -l %%B -r %receptor% -o %%a\dock.dpf
	)
)

For %%A in ("%receptor%") do (
    set rec_name=%%~nA
    )

for /d %%a in (%~dp0*) do (
	for %%b in (%%a\*.pdbqt) do (
	C:\autodock\python.exe C:\autodock\Lib\site-packages\AutoDockTools\Utilities24\prepare_gpf4.py -l %%b -r %receptor% -i %ref_file% -o %%a\grid_%rec_name%.gpf
	)
)
pause

for /d %%a in (%~dp0*) do copy %receptor% %%a
for /d %%a in (%~dp0*) do copy  %dockingbat% %%a
for /d %%a in (%~dp0*) do copy  %gridmap% %%a

pause
