@echo off
chcp 65001>nul

set /p pw= < password.hiddenfile
if '%*'=='' (set /p cm="Текст коммита: ") ELSE (set cm=%*)

rar u -hp%pw% rclone_conf.rar rclone.conf *.cmd

git add .
git commit -am "%cm%"
git push
