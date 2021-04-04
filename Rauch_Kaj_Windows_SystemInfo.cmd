@ECHO OFF
:: Achtung dieses Skript funktioniert nur wirklich gut unter einer Deutschen Windows Installation!!!
:: Dieses Skript gibt verschiedene Infos über das Betriebssystem aus.
ECHO Windows 10 Information

systeminfo > systeminfo.temp

set /p systemInfoOutput=< systeminfo.temp

del systeminfo.temp

echo %systemInfoOutput% | findstr /c:"Hostname"
echo %systemInfoOutput% | findstr /c:"Betriebssystemversion"
echo %systemInfoOutput% | findstr /c:"Benutzer"
echo %systemInfoOutput% | findstr /c:"Gesamter physischer Speicher"


ipconfig | findstr /c:"IPv4"

ECHO CPU Information
wmic cpu get name, numberofcores

ECHO Disk Information
wmic diskdrive get name, model, size

:: Okay ich habe mich daran versucht... Outputs von Befehlen können auf keine gute Weise in Variablen gespeichert werden, irgendwie werden meine Outputs verdreht ausgegeben,
:: Und Programme funktionieren in unterschiedlichen Sprachen je nach Installation.
:: Schauen sie doch ob es hier nicht mehr Sinn machen würde sich Powershell anzuschauen.
:: In meinen rund 6 Jahren in der IT habe ich noch nie ein Windows Batch Programm geschrieben oder kam damit in Kontakt.

PAUSE