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
echo --  Your vim environment is freshed convinently, so just
echo --  enjoy life, enjoy coding.
echo --
echo --  It will search the following 4 paths in each drive:
echo --  Path1: "X%INSTALL_PATH_1%"
echo --  Path2: "X%INSTALL_PATH_2%"
echo --  Path3: "X%INSTALL_PATH_3%"
echo --  Path4: "X%INSTALL_PATH_4%"
echo ----------------------------------------------------------
echo --  OK, let's begin
pause

REM ------------------------------------------------------------
REM Search for vim install dir
REM ------------------------------------------------------------
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
    copy /y %cd%\resource\_vimrc %vim_dir_value%
    copy /y %cd%\resource\solarized.vim %vim_dir_value%\%vim_dir_next%\colors
    copy /y %cd%\resource\molokai.vim %vim_dir_value%\%vim_dir_next%\colors
    copy /y %cd%\resource\vlog_inst_gen.vim %vim_dir_value%\%vim_dir_next%\plugin
    echo ##  Copy file finish !
    :: ------------------------------------------------------------
    :: Install font
    :: ------------------------------------------------------------
    echo ##  Installing fonts ...
    set fontExtensions=(ttf otf)
    for %%x in %fontExtensions% do ( xcopy /y %cd%\resource\*.%%x %windir%\fonts\ )
    ::注册字体，单纯的拷贝不会安装成功
    echo ##  Registering font ...
    reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT
    if %OS%==32BIT START "FontReg" %cd%\resource\FontRegx86.exe
    if %OS%==64BIT START "FontReg" %cd%\resource\FontRegx64.exe
    echo.
    echo ==========================================================
    echo             SUCCESS: VIM UPDATED !
    echo ==========================================================
) else (
    echo ##  Searching finish!
    echo ##  Installation folder: NOT find!
    echo.
    echo ==========================================================
    echo               ERROR: VIM NOT FOUND !
    echo ==========================================================
)
pause
