@echo off
taskkill /IM "explorer.exe" /F

::������� ������ ������
start "" "%WINDIR%\System32\cmd.exe" /c "echo off | clip"

::�������� ��� DNS
ipconfig /flushdns

::������� ��������
For /F "Tokens=1* Delims==" %%A In ('WMIC NTEVENTLOG GET LogFileName /Value^|FindStr .') Do (
	Call WMIC NTEVENTLOG Where ^(LogFileName^="%%B"^) Call ClearEventLog 1>nul
)

::�������� ���� ���������������� ���������� �� IE (� ��� ����� � ��������)
rundll32.exe InetCpl.cpl,ClearMyTracksByProcess 255
rd /s /q "%WINDIR%\Downloaded Program Files"

::������� ��������� ������
rd /s /q "%SYSTEMDRIVE%\MSOCache"
rd /s /q "%SYSTEMDRIVE%\Temp"
rd /s /q "%USERPROFILE%\AppData\Local\Temp"
rd /s /q "%WINDIR%\msdownld.tmp"
rd /s /q "%WINDIR%\Prefetch"
rd /s /q "%WINDIR%\ServiceProfiles\LocalService\AppData\Local\Temp"
rd /s /q "%WINDIR%\ServiceProfiles\NetworkService\AppData\Local\Temp"
rd /s /q "%WINDIR%\System32\DriverStore\Temp"
rd /s /q "%WINDIR%\System32\Macromed\Temp"
rd /s /q "%WINDIR%\SysWOW64\DriverStore\Temp"
rd /s /q "%WINDIR%\SysWOW64\Macromed\Temp"
rd /s /q "%WINDIR%\Temp"
rd /s /q "%WINDIR%\winsxs\Temp"

::������� logs
del "%WINDIR%\debug\*.log" /s /q
del "%WINDIR%\inf\*.log" /q
del "%WINDIR%\Microsoft.NET\Framework\*.log" /s /q
del "%WINDIR%\Performance\WinSAT\*.log" /q
del "%WINDIR%\ServiceProfiles\*.log" /s /q
del "%WINDIR%\System32\LogFiles\*.EVM*" /s /q
del "%WINDIR%\System32\LogFiles\*etl*.*" /s /q
del "%WINDIR%\System32\LogFiles\WUDF\*.*" /s /q
del "%WINDIR%\System32\wbem\Logs\*.log" /q
rd /s /q "%WINDIR%\Logs"
rd /s /q "%WINDIR%\security\Logs"
rd /s /q "%WINDIR%\System32\wbem\Logs"
rd /s /q "%WINDIR%\System32\winevt\Logs"
rd /s /q "%WINDIR%\SysWOW64\wbem\Logs"

::������� ���� ������������ ���������
rd /s /q "%SYSTEMDRIVE%\ATI"
rd /s /q "%SYSTEMDRIVE%\Intel"
rd /s /q "%SYSTEMDRIVE%\NVIDIA"

::������� ������ ��������� ������ �� ����
rd /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Burn"

::������� ����������� ������
del "%USERPROFILE%\AppData\Local\Microsoft\Windows\History\*.*" /s /q

::������� ���� �������
del "%USERPROFILE%\.thumbnails\*.*" /q
del /F /S /Q /A "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db"

::������� ����������
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\CIDSizeMRU" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\FirstFolder" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StreamMRU" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\WordWheelQuery" /f

::������� Paint
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "BMPHeight" /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Paint\View" /v "BMPWidth" /f

::������� ���� ������� � ������� �����������
reg delete "HKCU\SOFTWARE\Classes\Local Settings\SOFTWARE\Microsoft\Windows\CurrentVersion\TrayNotify" /v "IconStreams" /f
reg delete "HKCU\SOFTWARE\Classes\Local Settings\SOFTWARE\Microsoft\Windows\CurrentVersion\TrayNotify" /v "PastIconsStream" /f

::������� Wordpad
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List" /f

::������� regedit
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\regedit" /v "LastKey" /f

start explorer.exe
exit