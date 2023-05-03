@echo off
@echo T K N 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
@echo config credential.helper store

set stage=11
cd c:\kaggle
IF %ERRORLEVEL% NEQ 0 GOTO E_R_R_O_R

set stage=22
git pull -v
IF %ERRORLEVEL% NEQ 0 GOTO E_R_R_O_R

GOTO ALL_OKAY

:E_R_R_O_R
	echo .
	echo ".            GIT PULL FAILED!!!!                         GIT PULL FAILED!!!!"
	echo Error at stage %stage%
	echo               %ERRORLEVEL% 
	echo .
	pause
exit

:ALL_OKAY
    git status -uno
	echo .
    echo               -PULL worked fine! 
	echo .
	timeout /t 6
	@rem echo 5 secs to exit.
	@rem timeout /t 5 >nul