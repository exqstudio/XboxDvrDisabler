schtasks /Create /SC ONLOGON /RL HIGHEST /TN "Xbox DVR Auto disable" /TR "G:\Programs\xboxdvrdisabler.exe"

schtasks /Delete /F /TN "Xbox DVR Auto disable"

pause