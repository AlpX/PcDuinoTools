#!/bin/bash
# PcDuino 3 nano led blink
# worked on Linux linaro-alip 3.4.79+ image from pcduino web site
# by Alp_X http://alpx.io/

#modprobe gpio-sunxi
modprobe gpio


# another led on exists on pin 19
echo 18 > /sys/class/gpio/export
directionfile="/sys/devices/virtual/misc/gpio/mode/gpio18"
valuefile="/sys/devices/virtual/misc/gpio/pin/gpio18"
 
echo "Direction file is ${directionfile}"
echo "Value     file is ${valuefile}"
  
echo 1 > ${directionfile}
 
 
for i in `seq 1 20`
do
echo "On"
sleep 1
echo  1 > ${valuefile}
sleep 1
echo "Off"
echo  0 > ${valuefile}
done
 
echo 18 > /sys/class/gpio/unexport
modprobe -r gpio
#modprobe -r gpio-sunxi
