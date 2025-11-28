@echo off
SETLOCAL ENABLEEXTENSIONS

SET "rot=%~dp0"
SET "log=d:\tmp\%1_drive_rclone.log"
SET "cfg=%rot%rclone.conf"

if "%~1"=="" goto help
if /i "%~1"=="h" goto help

SET "var=%~1"
echo.%var%| findstr /i "[abyu]" >nul || goto help

# при загрузке отложить запуск на полминуты
if /i `%2`==`BOOT` timeout /T 33

SET "cmd="
if /i "%var%"=="a" SET "cmd=mount mus: A:"
if /i "%var%"=="b" SET "cmd=mount bc0: B:"
if /i "%var%"=="y" SET "cmd=mount yy0: Y:"
if /i "%var%"=="u" SET "cmd=mount uu0: U:"

if not defined cmd goto help

if exist %var%:\nul (
    echo Drive %var%: is already in use.
    exit /b 1
)

cd /d %rot%

SET "cmn=--disable config-lock --config "%cfg%" --no-update-modtime --vfs-cache-mode full --log-file "%log%" --log-level NOTICE"
SET "eltitle=%cmd%"
call :set_title %var%
start /min "%eltitle%" "c:\progra~1\rclone\rclone.exe" %cmd% %cmn%


goto :eof

:: ѕредварительно, нужно установить `sshfs`
:: https://github.com/winfsp/winfsp/releases
:: https://github.com/winfsp/sshfs-win/releases

:set_title
if /i `%1`==`a` set "eltitle=A: <== mus"
if /i `%1`==`b` set "eltitle=B: <== bc0"
exit /b

@exit 

:help
echo off
echo.
echo ============= RCLONE mount to a:, u: or y: ==============
echo.
echo %1 [a^|y^|u^|h]
echo   a - mounts mus: remote to A: drive
echo   b - mounts bc0: remote to B: drive
echo   y - mounts yy0: remote to Y: drive
echo   u - mounts uu0: remote to U: drive
echo   h - output this help
echo.
echo ======================================================
echo.

@exit
