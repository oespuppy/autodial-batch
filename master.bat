@echo off
echo %time%

set �����˺�=��������˺�
set ��������=�����������
set �������=�������

for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do (set desktop=%%j)
for /f %%a in ('"prompt $H&for %%b in (1) do rem"') do set "BS=%%a"
echo �ȴ������豸���� ...
ping /n 30 127.1>nul
rasdial %�������% %�����˺�% %��������%
ipconfig /flushdns
echo ������ ...
start "" "RunDll32.exe" InetCpl.cpl,ClearMyTracksByProcess 255
ping -n 1 www.baidu.com
ping -n 1 www.sogou.com
ping -n 1 www.so.com
ping -n 1 m.baidu.com
ping -n 1 m.sogou.com
ping -n 1 m.so.com
ping -n 1 www.bing.com
ping /n 30 127.1>nul
echo ������������ ...
start "" "%desktop%\kuaipai\��������.exe"
set /p=�ȴ��л�IP ....................................<nul
set timeout=36
set counter=0
: loop
set /a counter=%counter%+1
if %counter% LEQ %timeout% (
set/p=%BS% %BS%<nul
ping /n 5 127.1>nul
goto loop
)
cls
echo %time%
set counter=0
echo �Ͽ�%�������% ...
rasdial %�������% /disconnect
echo �ȴ�%�������%���׶Ͽ� ...
ping /n 10 127.1>nul
rasdial %�������% %�����˺�% %��������%
ipconfig /flushdns
echo ������ ...
start "" "RunDll32.exe" InetCpl.cpl,ClearMyTracksByProcess 255
ping -n 1 www.baidu.com
ping -n 1 www.sogou.com
ping -n 1 www.so.com
ping -n 1 m.baidu.com
ping -n 1 m.sogou.com
ping -n 1 m.so.com
ping -n 1 www.bing.com
set /p=�ȴ��л�IP ....................................<nul
goto loop
