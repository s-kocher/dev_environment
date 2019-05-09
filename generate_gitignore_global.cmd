@echo off

REM Use https://www.gitignore.io/ API
REM You need to have gi.cmd in path as described in https://docs.gitignore.io/install/command-line (End of Windows section)

SET OUTPUT_DIR=%HOME%
REM SET OUTPUT_DIR=%USERPROFILE%
REM SET OUTPUT_DIR=.

SET OUTPUT_NAME=.gitignore_global
SET OUTPUT=%OUTPUT_DIR%\%OUTPUT_NAME%

SET GI_OS=linux,windows,macos
SET GI_PROG_LANGUAGES=java,node,maven
SET GI_IDE=code,eclipse,intellij

If not exist %OUTPUT% GOTO :generatefile

FOR /F "skip=1" %%D IN ('WMIC OS GET LocalDateTime') DO (SET LIDATE=%%D & GOTO :GOT_LIDATE)
:GOT_LIDATE
SET DATETIME=%LIDATE:~0,4%-%LIDATE:~4,2%-%LIDATE:~6,2%_%LIDATE:~8,2%%LIDATE:~10,2%%LIDATE:~12,2%
SET BKP_TARGET=%OUTPUT_NAME%_%DATETIME%.bkp
ren %OUTPUT% %BKP_TARGET%
echo Existing file %OUTPUT%, backup it %BKP_TARGET%

:generatefile

echo Generating global git ignore file in %OUTPUT%

echo #-----------------------------------# > %OUTPUT%
echo #          GLOBAL GITIGNORE         # >> %OUTPUT%
echo #-----------------------------------# >> %OUTPUT%
echo. >> %OUTPUT%

echo #-----------------------------# >> %OUTPUT%
echo #           ~Custom~          # >> %OUTPUT%
echo #-----------------------------# >> %OUTPUT%
echo ._.DS_Store >> %OUTPUT%
echo. >> %OUTPUT%

echo #-----------------------------# >> %OUTPUT%
echo #     ~Operating Systems~    -# >> %OUTPUT%
echo #-----------------------------# >> %OUTPUT%
CALL gi %GI_OS% >> %OUTPUT%
echo. >> %OUTPUT%

echo #-----------------------------# >> %OUTPUT%
echo #- ~Programmation languages~ -# >> %OUTPUT% 
echo #-----------------------------# >> %OUTPUT%
CALL gi %GI_PROG_LANGUAGES% >> %OUTPUT%
echo. >> %OUTPUT%

echo #-----------------------------# >> %OUTPUT%
echo #-   ~Code editors and IDE~  -# >> %OUTPUT%
echo #-----------------------------# >> %OUTPUT%
CALL gi %GI_IDE% >> %OUTPUT%
echo. >> %OUTPUT%

@echo ON