#tool created by:prince gutierez
#run this tool to install ngrok in termux
red='\033[31;1m'
clear
read -p "PRESS ENTER TO CONTINUE " ENTER
sleep 1
echo -e $red PLEASE TURN OFF WIFI AND USE MOBILE DATA FOR INTERNET AND TO TURN ON HOTSPOT
echo -e $red PLEASE ENTER PORT 4 DIGITS
read -p "ENTER PORT " IDRAS
if [ $IDRAS = 0 ]; then
./ngrok tcp $IDRAS
bash ngrok.sh
