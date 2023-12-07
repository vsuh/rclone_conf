:: Скрипт для синхронизации папок obsidian с Y: на U:
chcp 65001>nul
set rem1=yy0:OBSIDIAN.RC
set rem2=uu0:OBSIDIAN.RC.GOOGLE
set log=D:\tmp\RCLONE__sync.log
::-vvv
echo %DATE% %TIME% --------------------------------------------------------------- >>%log%
set cmd= -c --check-first --ignore-case-sync --config rclone.conf --log-file %log% --log-level INFO

c:\progra~1\rclone\rclone.exe sync %cmd% %rem1% %rem2%
::: не нужно? c:\progra~1\rclone\rclone.exe sync %cmd% %rem2% %rem1%