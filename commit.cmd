@echo off
chcp 65001>nul
set /p pw= < password.hiddenfile
set /p cm="Текст коммита: "

rar u -hp%pw% rclone_conf.rar rclone.conf

git add .
git commit -am "%cm%"
git push
