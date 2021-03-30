#!/bin/bash
## Coded by : PRINCE GUTIERREZ
## version  : 2.1.4
## Github   : https://github.com/PRINCEGUT-12
red='\033[32;1m'

dependencies() {

command -v wget > /dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Install it. Aborting."; exit 1; }
command -v php > /dev/null 2>&1 || { echo >&2 "I require php but it's not installed. Install it. Aborting."; exit 1; }
  
  


}





download_ngrok() {
	url="$1"
	file=`basename $url`
	if [[ -e "$file" ]]; then
		rm -rf "$file"
	fi
	wget --no-check-certificate "$url" > /dev/null 2>&1
	if [[ -e "$file" ]]; then
		unzip "$file" > /dev/null 2>&1
		mv -f ngrok .server/ngrok > /dev/null 2>&1
		rm -rf "$file" > /dev/null 2>&1
		chmod +x .server/ngrok > /dev/null 2>&1
	else
		echo -e $red Error occured, Install Ngrok manually."
		{ reset_color; exit 1; }
   fi
}

## Install ngrok
install_ngrok() {
	 [[ -e ".server/ngrok" ]]; then
		echo -e $red NGROK IS ALREADY INSTALLED
	else
		echo -e $red INSTALLING NGROK
		arch=`uname -m`
		if [[ ("$arch" == *'arm'*) || ("$arch" == *'Android'*) ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip'
		elif [[ "$arch" == *'aarch64'* ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm64.zip'
		elif [[ "$arch" == *'x86_64'* ]]; then
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip'
		else
			download_ngrok 'https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip'
		fi
	fi

}


## Banner
banner() {
echo -e $red ███╗░░██╗░██████╗░██████╗░░█████╗░██╗░░██╗
echo -e $red ████╗░██║██╔════╝░██╔══██╗██╔══██╗██║░██╔╝
echo -e $red ██╔██╗██║██║░░██╗░██████╔╝██║░░██║█████═╝░
echo -e $red ██║╚████║██║░░╚██╗██╔══██╗██║░░██║██╔═██╗░
echo -e $red ██║░╚███║╚██████╔╝██║░░██║╚█████╔╝██║░╚██╗
echo -e $red ╚═╝░░╚══╝░╚═════╝░╚═╝░░╚═╝░╚════╝░╚═╝░░╚═╝v2.1.4
echo -e $red Coded by:PRINCE GUTIERREZ
echo -e $red GITHUB:https://github.com/PRINCEGUT-12
   fi   
}

tools() {

echo -e $red  "[U] > UPDATE
echo -e $red  "[1] > NGROK TCP
echo -e $red  "[2] > NGROK HTTP
echo -e $red  "[X] > EXIT
read -p "PLEASE SELECT OPTION " IDRA

if [ $IDRA == "U" ]; then
echo
cd $HOME/NGROK/UPDATE
bash update.sh

elif [ $hack == "1" ]; then 
echo
cd $HOME/NGROK/TCP
bash tcp.sh

elif [ $hack == "2" ]; then
echo
cd $HOME/NGROK/HTTP
bash http.sh 

elif [ $hack == "X" ]; then
exit
  fi   
}

dependencies
download_ngrok
install_ngrok
