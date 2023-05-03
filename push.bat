@echo off

IF [%1%] equ [] (
	set COMMENT="Quick Commit!"
) ELSE (
	set COMMENT=%1%
)

echo .
echo .
echo Commit Comment: %COMMENT%
echo .
echo .
@echo T K N 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
@echo config credential.helper store
echo .
echo .

git status -uno
git status -uno >> ROLLING_GIT_STATUS.txt
git add .
git commit -m %COMMENT%
git push -v > git-push-log.log 2>&1

IF %ERRORLEVEL% NEQ 0 GOTO E_R_R_O_R

GOTO ALL_OKAY

:E_R_R_O_R
	echo ".                GIT PUSH Failed!!!!                      GIT PUSH Failed!!!!"
	echo                   OS ERROR:          %ERRORLEVEL% 
	pause
exit

:ALL_OKAY
	echo .
	echo                      Push worked fine! 
	timeout /t 6
	@rem echo 5 secs to exit.
	@rem timeout /t 5 >nul
exit
