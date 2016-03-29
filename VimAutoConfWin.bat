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
REM Display Welcome
REM ------------------------------------------------------------
echo ----------------------------------------------------------
echo --          Vim Config Auto Load Program               
echo --                                           win version  
echo ----------------------------------------------------------
echo --  This file automatically search vim installation path, 
echo --  then copy _vimrc and related configuration files to   
echo --  vim installation path. 
echo --  Your vim environment is freshed so convinent, so just
echo --  enjoy life, enjoy coding.
echo ----------------------------------------------------------
echo --  OK, let's begin
pause

REM ------------------------------------------------------------
REM Search for vim install dir
REM ------------------------------------------------------------
echo.
echo.
echo ##  Searching for vim installation folder ...
set vim_dir_flag=0
set vim_dir_value=0
set vim_dir_next=0
setlocal enabledelayedexpansion
for %%i in (%HARD_DISK_ID%) do (
    if exist "%%i%INSTALL_PATH_1%" (
        set vim_dir_value="%%i%INSTALL_PATH_1%"
        set cur_dir=%cd%
        cd /d !vim_dir_value!
        for /d %%i in (*) do (
            echo %%i|findstr "vim[0-9][0-9]" >nul
            if %errorlevel% equ 0 (
                set vim_dir_flag=1
                set vim_dir_next="%%i"
                cd /d !cur_dir!
                goto L1_FINISH_SEARCH 
            )
        )
        cd /d !cur_dir!
    )
    if exist "%%i%INSTALL_PATH_2%" (
        set vim_dir_value="%%i%INSTALL_PATH_2%"
        set cur_dir=%cd%
        cd /d !vim_dir_value!
        for /d %%i in (*) do (
            echo %%i|findstr "vim[0-9][0-9]" >nul
            if %errorlevel% equ 0 (
                set vim_dir_flag=1
                set vim_dir_next="%%i"
                cd /d !cur_dir!
                goto L1_FINISH_SEARCH 
            )
        )
        cd /d !cur_dir!
    )
    if exist "%%i%INSTALL_PATH_3%" (
        set vim_dir_value="%%i%INSTALL_PATH_3%"
        set cur_dir=%cd%
        cd /d !vim_dir_value!
        for /d %%i in (*) do (
            echo %%i|findstr "vim[0-9][0-9]" >nul
            if %errorlevel% equ 0 (
                set vim_dir_flag=1
                set vim_dir_next="%%i"
                cd /d !cur_dir!
                goto L1_FINISH_SEARCH 
            )
        )
        cd /d !cur_dir!
    )
    if exist "%%i%INSTALL_PATH_4%" (
        set vim_dir_value="%%i%INSTALL_PATH_4%"
        set cur_dir=%cd%
        cd /d !vim_dir_value!
        for /d %%i in (*) do (
            echo %%i|findstr "vim[0-9][0-9]" >nul
            if %errorlevel% equ 0 (
                set vim_dir_flag=1
                set vim_dir_next="%%i"
                cd /d !cur_dir!
                goto L1_FINISH_SEARCH 
            )
        )
        cd /d !cur_dir!
    )
)
:L1_FINISH_SEARCH
setlocal disabledelayedexpansion

REM ------------------------------------------------------------
REM Copy file
REM ------------------------------------------------------------
if %vim_dir_flag%==1 (
    echo ##  Searching finish !
    echo ##  Installation folder: %vim_dir_value%
    echo ##  Copying files ...
    copy /y .\resource\_vimrc %vim_dir_value%
    copy /y .\resource\solarized.vim %vim_dir_value%\%vim_dir_next%\colors
    echo ##  Copy file finish !
    echo.
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    echo             SUCCESS: VIM UPDATED !
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
) else (
    echo ##  Searching finish!
    echo ##  Installation folder: NOT find!
    echo.
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    echo               ERROR: VIM NOT FOUND !
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    echo ~~ Search Path1: "X%INSTALL_PATH_1%"
    echo ~~ Search Path2: "X%INSTALL_PATH_2%"
    echo ~~ Search Path3: "X%INSTALL_PATH_3%"
    echo ~~ Search Path4: "X%INSTALL_PATH_4%"
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
)
pause
