@echo off
color 3
title Backuping

set host=192.168.1.225
set login=root
set password=root
set d1=%date:~6,4%-%date:~3,2%-%date:~0,2%
set filename=stats-%d1%.sql.gz
set backup_dir=/usr/abills
set backup_file=/usr/abills/backup/%filename%
set local_backup_dir=D:\backup\
set PuTTY_install_dir=C:/PuTTY/

echo "Downloading %backup_file% -> %local_backup_dir%"
%PuTTY_install_dir%pscp -P 22 -pw %password%  %login%@%host%:%backup_file% %local_backup_dir%
if not exist %local_backup_dir%%filename% (lib.exe 3000 250 /r 9 & echo No such file) else (lib.exe 2000 500 & echo All done)

color 07