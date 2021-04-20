@echo off
set receptor=%~dp02iyq.pdbqt
rem change here
set dockingbat=%~dp0docking.bat
set gridmap=%~dp0grid_map.bat

set ref_file=%~dp0ref_2iyq.gpf
rem change here

echo the docking batch file is %dockingbat%
echo the receptor file is %receptor%

echo the gpf reference file is %ref_file%
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

