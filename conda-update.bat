@echo off
echo Anaconda Package Updater v0.1
set root=%USERPROFILE%\anaconda3
call %root%\Scripts\activate.bat %root%
for /f "tokens=1 skip=3 delims= " %%i in ('conda info --envs') do (
	call conda activate %%i 
	call conda update --a --yes
	for /f  "tokens=1 delims= " %%p in ('pip list -o') do (
		pip install --upgrade %%p
		echo %%p Updated!
	)
)
echo Update Done!
pause