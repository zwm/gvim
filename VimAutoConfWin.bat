@echo off
REM File Name       : VimAutoConfWin.bat
REM Description     : Auto configure vim for Windows system
REM Author          : zwm
REM Time            : 20160329

REM ------------------------------------------------------------
REM Const Definition
REM ------------------------------------------------------------
set HARD_DISK_ID=C D E F G H I J K L M N O P Q R S T U V W X Y Z
set INSTALL_PATH_1=:\Program Files\vim
set INSTALL_PATH_2=:\Program Files (x86)\vim
set INSTALL_PATH_3=:\Program\vim
set INSTALL_PATH_4=:\vim
REM ------------------------------------------------------------


REM ------------------------------------------------------------
REM Search for vim install dir
REM ------------------------------------------------------------
set vim_dir_flag=0
REM set vim_dir_value=0
for %%i in (%HARD_DISK_ID%) do (
    if exist "%%i%INSTALL_PATH_1%" (
        set vim_dir_flag=1
        set vim_dir_value="%%i%INSTALL_PATH_1%"
        goto L1_FINISH_SEARCH 
    )
    if exist "%%i%INSTALL_PATH_2%" ( echo OK
        set vim_dir_flag=1
        set vim_dir_value="%%i%INSTALL_PATH_2%"
        goto L1_FINISH_SEARCH 
    )
    if exist "%%i%INSTALL_PATH_3%" (
        set vim_dir_flag=1
        set vim_dir_value="%%i%INSTALL_PATH_3%"
        goto L1_FINISH_SEARCH 
    )
    if exist "%%i%INSTALL_PATH_4%" (
        set vim_dir_flag=1
        set vim_dir_value="%%i%INSTALL_PATH_4%"
        goto L1_FINISH_SEARCH 
    )
)

:L1_FINISH_SEARCH
echo %vim_dir_flag%
echo %vim_dir_value%
