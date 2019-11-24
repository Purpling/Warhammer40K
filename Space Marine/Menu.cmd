echo off
title SMCE Menu
color 0f
:menu
cls
set Item=-1
set Items=-1
for /D %%i in (Items\*) do set /a Items+=1
if %Items%==-1 echo No items. & goto menu
:count
set /a Item+=1
set /p Name=<Items\%Item%\Name.txt
set /p Id=<Items\%Item%\Id.txt
set Numbers=0
set Temp=%Name%
:take
set Temp=%Temp:~1%
set /a Numbers+=1
if not "%Temp%"=="" goto take
set /a Numbers=27+-%Numbers%
set Times=0
:add
set /a Times+=1
set Name=%Name% 
if not %Times%==%Numbers% goto add
if %Item%==0                        echo :=======================-Perks Start-=======================:
if %Item% geq 0  if %Item% leq 7    echo {Assault}      (Green)       %Name%%Id%
if %Item% geq 8  if %Item% leq 13   echo {Assault}      (Red)         %Name%%Id%
if %Item% geq 14 if %Item% leq 21   echo {Tactical}     (Green)       %Name%%Id%
if %Item% geq 22 if %Item% leq 33   echo {Tactical}     (Red)         %Name%%Id%
if %Item% geq 34 if %Item% leq 42   echo {Devastator}   (Green)       %Name%%Id%
if %Item% geq 43 if %Item% leq 48   echo {Devastator}   (Red)         %Name%%Id%
if %Item%==48                       echo :========================-Perks End-========================:
if %Item%==48                       echo \              !             !                              /
if %Item%==49                       echo /              !             !                              \
if %Item%==49                       echo :======================-Weapons Start-======================:
if %Item% geq 49 if %Item% leq 57   echo {Space Marine} {Assault}     %Name%%Id%
if %Item% geq 58 if %Item% leq 69   echo {Space Marine} {Tactical}    %Name%%Id%
if %Item% geq 70 if %Item% leq 73   echo {Space Marine} {Devastator}  %Name%%Id%
if %Item% geq 74 if %Item% leq 82   echo {Chaos Marine} {Raptor}      %Name%%Id%
if %Item% geq 83 if %Item% leq 94   echo {Chaos Marine} {Tactical}    %Name%%Id%
if %Item% geq 95 if %Item% leq 98   echo {Chaos Marine} {Havoc}       %Name%%Id%
if %Item%==98                       echo :=======================-Weapons End-=======================:
if %Item%==98                       echo \              !             !                              /
if %Item%==99                       echo /              !             !                              \
if %Item%==99                       echo :======================-Armors Start-=======================:
if %Item% geq 99 if %Item% leq 99   echo {Multi Class}  {Unspecified} %Name%%Id%
if %Item% geq 100 if %Item% leq 100 echo {Multi Class}  {Tactical}    %Name%%Id%
if %Item% geq 101 if %Item% leq 101 echo {Multi Class}  {Devastator}  %Name%%Id%
if %Item% geq 102 if %Item% leq 102 echo {Multi Class}  {Assault}     %Name%%Id%
if %Item% geq 103 if %Item% leq 103 echo {Space Marine} {Assault}     %Name%%Id%
if %Item% geq 104 if %Item% leq 104 echo {Chaos Marine} {Assault}     %Name%%Id%
if %Item%==104                    echo :=======================-Armors End-========================:
if not %Item%==%Items% goto count
echo ____________________________________________________________
echo %Command%
set Command=Blank
set /p Command=">"
for /f "tokens=* delims=qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM" %%c in ("%Command%") do set Command=%%c
:info
set Test=[%Command%]
set Item=-1
:get
set /a Item+=1
set /p Name=<Items\%Item%\Name.txt
set /p Id=<Items\%Item%\Id.txt
if %Id%==%Test% set Command=%Name% & goto menu
if not %Item%==%Items% goto get
set Command=%Test% is not a valid id.
goto menu