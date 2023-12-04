cd /d %~dp0
SET log=d:\tmp\%1_drive_rclone.log
SET env=D:\tmp\a_drive_rclone.ENV


SET var=h
IF `%1`==`a` SET var=a
IF `%1`==`y` SET var=y
IF `%1`==`u` SET var=u
call :vars %~nx0
if EXIST %var%:\nul exit
start /min c:\progra~1\rclone\rclone.exe %cmd%
goto :eof

:: Предварительно, нужно установить `sshfs`
:: https://github.com/winfsp/winfsp/releases
:: https://github.com/winfsp/sshfs-win/releases

:vars
@if `h`==`%var%` goto :help
@if `a`==`%var%` SET cmd= --config rclone.conf --log-file %log% --log-level NOTICE mount ml0: A: --vfs-cache-mode full
@if `u`==`%var%` SET cmd= --config rclone.conf --log-file %log% --log-level NOTICE mount uu0: U: --vfs-cache-mode full
@if `y`==`%var%` SET cmd= --config rclone.conf --log-file %log% --log-level NOTICE mount uu0: U: --vfs-cache-mode full

@exit /b

:help
echo off
echo.
echo ============= RCLONE mount to a:, u: or y: ==============
echo.
echo %1 [a^|y^|u^|h]
echo   a - mounts ml0: remote to A: drive
echo   y - mounts yy0: remote to Y: drive
echo   u - mounts uu0: remote to U: drive
echo   h - output this help
echo.
echo ======================================================
echo.

exit