@echo off
chcp 65001>nul
set /p pw="Пароль для архива: "
set /p cm="Текст коммита: "

rar u -p%pw% rclone_conf.rar rclone.conf
git add .
git commit -am "%cm%"
git push
