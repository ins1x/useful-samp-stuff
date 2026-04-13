@echo off
setlocal
taskkill /F /IM samp-server*
timeout /t 3
cd "c:\www\Insane DM"
del /s %CD%\server_log.txt
call "samp-server.exe"
exit /b