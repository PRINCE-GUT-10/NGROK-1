#this tool program by:prince gutierrez
#this tool help you get ngrok link
blue='\033[31;1m'
red='\033[32;1m'
green='\033[33;1m'
white='\033[34;1m'

dependencies() {

command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
  
  


}



tools(){

echo-e $red ███╗░░██╗░██████╗░██████╗░░█████╗░██╗░░██╗
echo-e $red ████╗░██║██╔════╝░██╔══██╗██╔══██╗██║░██╔╝
echo-e $red ██╔██╗██║██║░░██╗░██████╔╝██║░░██║█████═╝░
echo-e $red ██║╚████║██║░░╚██╗██╔══██╗██║░░██║██╔═██╗░
echo-e $red ██║░╚███║╚██████╔╝██║░░██║╚█████╔╝██║░╚██╗
echo-e $red █═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝
echo
echo-e $red  "[U] > UPDATE"
echo-e $red  "[1] > HTTP"
echo-e $red  "[2] > TCP"
echo-e $red  "[X] > EXIT"
read -p "PLEASE SELECT OPTION: " hug


if [ $hug == "U" ]; then
cd $HOME/NGROK/UPDATE
bash update.sh

elif [ $hug == "1" ]; then
cd $HOME/NGROK/HTTP
bash http.sh

elif [ $hug == "2" ]; then
cd $HOME/NGROK/TCP
bash tcp.sh

elif [ $hug == "X" ]; then
exit
   fi
}

stop() {
checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi

if [[ $checkphp == *'php'* ]]; then
killall -2 php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
killall -2 ssh > /dev/null 2>&1
fi
exit 1

}

check_ngrok() {
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


ngrok_server() {


if [[ -e ngrok ]]; then
echo ""
else
command -v unzip > /dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Install it. Aborting."; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
printf "\e[1;92m[\e[0m+\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
echo -e $blue [!] DOWNLOADING ERROR , PLEASE INSTALL WGET , pkg install wget
exit 1
fi

else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
echo -e $blue[!] Downloading error
exit 1
fi
fi
fi

}

dependencies
check_ngrok
ngrok_server
tools
stop
