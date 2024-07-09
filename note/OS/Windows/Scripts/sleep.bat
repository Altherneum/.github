@echo off
set /p "min=Nombres de minutes : "
set /a sec="min*60"
echo Mise en veille dans %min% minutes (%sec% secondes)
timeout /t %sec%&&rundll32.exe powrprof.dll,SetSuspendState Sleep