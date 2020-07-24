@echo off
taskkill /f /im explorer.exe
 
set "Key=HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel"
 



::桌面显示我的电脑（计算机，此电脑）
reg add "%Key%" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t reg_dword /d 0 /f

::桌面显示我的电脑（计算机，此电脑）
reg add "%Key%" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t reg_dword /d 0 /f

::桌面显示网络
reg add "%Key%" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t reg_dword /d 0 /f
 
::桌面显示控制面板
reg add "%Key%" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t reg_dword /d 0 /f


 
start "" explorer.exe
pause