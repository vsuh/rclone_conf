cd /d %~dp0
SET log=d:\tmp\a_drive_rclone.log
SET env=D:\tmp\a_drive_rclone.ENV

if EXIST a:\nul exit

::echo CD=%CD%>%env%
::SET>>%env%
start /min /i c:\progra~1\rclone\rclone.exe ^
	--config rclone.conf ^
	--log-file %log% ^
	--log-level NOTICE ^
	mount ml0: a: ^
	--vfs-cache-mode full

:: Предварительно, нужно установить `sshfs`
:: https://github.com/winfsp/winfsp/releases
:: https://github.com/winfsp/sshfs-win/releases