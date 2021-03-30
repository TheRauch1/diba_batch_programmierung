@ECHO OFF
:: Achtung dieses Skript funktioniert nur wirklich gut unter einer Deutschen Windows Installation!!!
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

:: Okay ich habe mich daran versucht... Ich bin so direkt und sage es jetzt mal so. BATCH auf Windows ist einfach SCHEISSE.
:: Befehle können auf keine gute Weise in Variablen gespeichert werden, irgendwie werden meine Outputs verdreht,
:: Und Programme sind in unterschiedlichen Sprachen je nach Installation.
:: Bitte, ich flehe sie an. Schauen sie doch ob es hier nicht mehr Sinn machen würde sich Powershell anzuschauen.

PAUSE