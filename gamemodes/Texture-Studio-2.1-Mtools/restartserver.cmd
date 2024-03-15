@echo off
setlocal
taskkill /F /IM samp-server*
timeout /t 3
call "samp-server.exe"
exit /b