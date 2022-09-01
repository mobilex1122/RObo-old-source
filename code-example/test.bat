echo off
cd ..
set L=0

:start
set /p T=<left.sensor
set /p D=<right.sensor

if %T%==True goto left

if %D%==True goto right

echo 0 > rotate.command
echo 1 > move.command


goto start

:left

echo 0 > move.command
echo 0.05 > rotate.command

goto start

:right

echo 0 > move.command
echo -0.05 > rotate.command
goto start

