echo off
:loop
set Item=-1
for /D %%i in (*) do set /a Item+=1
set /p Name=<%Item%\Name.txt
set /p Id=<%Item%\Id.txt
title Item: %Name% %Id%
cls
set /p Name="Name: "
set /p Id="Id: "
set /a Item+=1
mkdir %Item%
echo %Name%>%Item%\Name.txt
echo [%Id%]>%Item%\Id.txt
goto loop