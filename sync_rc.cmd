:: Скрипт для синхронизации папок obsidian с Y: на U:
:: 2023(c)VSCraft
@echo off
cd /d %~dp0
chcp 65001>nul
set src=yy0:OBSIDIAN.RC
set dst=uu0:OBSIDIAN.RC.GOOGLE
set log=D:\tmp\RCLONE__sync.log
::-vvv
echo %DATE% %TIME% ----------------------- CD: %cd% ---------------------------------------- >>%log%
set cmd= -c --check-first --ignore-case-sync --config rclone.conf --log-file %log% --log-level INFO
echo ..syncing %src% ^>^> %dst%
c:\progra~1\rclone\rclone.exe sync %cmd% %src% %dst%
::: не нужно? c:\progra~1\rclone\rclone.exe sync %cmd% %dst% %src%