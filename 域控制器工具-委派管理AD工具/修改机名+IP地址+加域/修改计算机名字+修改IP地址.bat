@ECHO off

color 4E

mode con: cols=75 lines=35

title    ��  Auto Join Domain @neal �� 

ECHO                      

ECHO                               �Զ�����������      

ECHO                      

ECHO

ECHO �������ϵͳ������..........

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

ECHO �����������......

pause>nul

cls

ECHO.

ECHO                      

ECHO                               �޸Ļ�������      

ECHO                      

ECHO

ECHO.

ECHO ���������ƴ˸�ʽ(ipt-000000-zida)

ECHO.

ECHO

ECHO.

set /p name=������������ƣ�

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

ECHO �������޸����......

echo.
echo ===�޸� [��������] ip��ַ===
echo.
echo 1:�Զ���ȡ
echo.
echo 2:��ͨip��ַ
echo.
echo.
set/p sel=��ѡ���޸ķ�ʽ��
if "%sel%"=="1" goto auto
if "%sel%"=="2" goto zt
echo ��û��ѡ���޸ķ�ʽ��
goto end
 
:auto
netsh interface ip set address name="��������" source=dhcp
netsh interface ip delete dns "��������" all
ipconfig /flushdns
ipconfig /all
goto end
 
:zt
echo ���ڸ���IP��ַ�����Ե�......
netsh interface ip set address name="��������" source=dhcp
netsh interface ip set dns name="��������" source=static addr=10.211.55.55
netsh interface ip add dns name="��������" addr=8.8.8.8 index=2 
ipconfig /flushdns
ipconfig /all
echo ����IP��ַ��ɣ�
goto end
 
:end
pause