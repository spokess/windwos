@ECHO off

color 4E

mode con: cols=75 lines=35

title    ⅸ  Auto Join Domain @neal ⅷ 

ECHO                      

ECHO                               自动加域批处理      

ECHO                      

ECHO

ECHO 启动相关系统服务中..........

sc config LmHosts start= AUTO

net start "TCP/IP NetBIOS Helper"

sc config Browser start= AUTO

net start "Computer Browser"

sc config Winmgmt start= AUTO

net start "Windows Management Instrumentation"

sc config LanmanServer start= AUTO

net start "Server"

sc config LanmanWorkstation start= AUTO

net start "Workstation"

ECHO.

ECHO 服务启动完成......

pause>nul

cls

ECHO.

ECHO                      

ECHO                               修改机器名称      

ECHO                      

ECHO

ECHO.

ECHO 机器名类似此格式(ipt-000000-zida)

ECHO.

ECHO

ECHO.

set /p name=请输入机器名称：

reg add "HKEY_LOCAL_MACHINE\System\ControlSet001\Control\ComputerName\ActiveComputerName" /v ComputerName /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\ControlSet001\Control\ComputerName\ComputerName" /v ComputerName /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\ControlSet001\Services\Tcpip\Parameters" /v "NV Hostname" /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\ControlSet001\Services\Tcpip\Parameters" /v Hostname /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\ControlSet002\Control\ComputerName\ActiveComputerName" /v ComputerName /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\ControlSet002\Control\ComputerName\ComputerName" /v ComputerName /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\ControlSet002\Services\Tcpip\Parameters" /v "NV Hostname" /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\ControlSet002\Services\Tcpip\Parameters" /v Hostname /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ActiveComputerName" /v ComputerName /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ComputerName\ComputerName" /v ComputerName /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters" /v "NV Hostname" /t reg_sz /d %name% /f >nul 2>nul

reg add "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Tcpip\Parameters" /v Hostname /t reg_sz /d %name% /f >nul 2>nul

ECHO.

ECHO 机器名修改完毕......

echo.
echo ===修改 [本地连接] ip地址===
echo.
echo 1:自动获取
echo.
echo 2:重通ip地址
echo.
echo.
set/p sel=请选择修改方式：
if "%sel%"=="1" goto auto
if "%sel%"=="2" goto zt
echo 您没有选择修改方式。
goto end
 
:auto
netsh interface ip set address name="本地连接" source=dhcp
netsh interface ip delete dns "本地连接" all
ipconfig /flushdns
ipconfig /all
goto end
 
:zt
echo 正在更改IP地址，请稍等......
netsh interface ip set address name="本地连接" source=dhcp
netsh interface ip set dns name="本地连接" source=static addr=10.211.55.55
netsh interface ip add dns name="本地连接" addr=8.8.8.8 index=2 
ipconfig /flushdns
ipconfig /all
echo 更改IP地址完成！
goto end
 
:end
pause