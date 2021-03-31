#coded by prince gutierrez
#run this program without error
red='\033[31;1m'
clear
read -p "PRESS ENTER TO CONTINUE " ENTER
sleep 1
echo -e $red PLEASE TURN OFF WIFI AND USE MOBILE DATA FOR INTERNET AND TO TURN ON HOTSPOT
echo -e $red PLEASE ENTER PORT 4 DIGITS
read -p "ENTER PORT " NGROK
if [ $NGROK = 0 ]; then
./ngrok http $NGROK
bash ngrok.sh
