#tool created by:prince gutierez
#run this tool to install ngrok in termux
red='\033[31;1m'
clear
echo ""
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e sendlink ]]; then
rm -rf sendlink
fi
echo ""
read -p "PRESS ENTER TO CONTINUE " ENTER
sleep 1
echo -e $red PLEASE TURN OFF WIFI AND USE MOBILE DATA FOR INTERNET AND TO TURN ON HOTSPOT
echo -e $red PLEASE ENTER PORT 4 DIGITS
read -p "ENTER PORT " IDRAS
if [ $IDRAS = 0 ]; then
./ngrok tcp $IDRAS

