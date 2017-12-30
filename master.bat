@echo off
echo %time%

set 拨号账号=这里填拨号账号
set 拨号密码=这里填拨号密码
set 宽带连接=宽带连接

for /f "tokens=2,*" %%i in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v "Desktop"') do (set desktop=%%j)
for /f %%a in ('"prompt $H&for %%b in (1) do rem"') do set "BS=%%a"
echo 等待网络设备启动 ...
ping /n 30 127.1>nul
rasdial %宽带连接% %拨号账号% %拨号密码%
ipconfig /flushdns
echo 清理缓存 ...
start "" "RunDll32.exe" InetCpl.cpl,ClearMyTracksByProcess 255
ping -n 1 www.baidu.com
ping -n 1 www.sogou.com
ping -n 1 www.so.com
ping -n 1 m.baidu.com
ping -n 1 m.sogou.com
ping -n 1 m.so.com
ping -n 1 www.bing.com
ping /n 30 127.1>nul
echo 启动快排助手 ...
start "" "%desktop%\kuaipai\快排助手.exe"
set /p=等待切换IP ....................................<nul
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
echo 断开%宽带连接% ...
rasdial %宽带连接% /disconnect
echo 等待%宽带连接%彻底断开 ...
ping /n 10 127.1>nul
rasdial %宽带连接% %拨号账号% %拨号密码%
ipconfig /flushdns
echo 清理缓存 ...
start "" "RunDll32.exe" InetCpl.cpl,ClearMyTracksByProcess 255
ping -n 1 www.baidu.com
ping -n 1 www.sogou.com
ping -n 1 www.so.com
ping -n 1 m.baidu.com
ping -n 1 m.sogou.com
ping -n 1 m.so.com
ping -n 1 www.bing.com
set /p=等待切换IP ....................................<nul
goto loop
