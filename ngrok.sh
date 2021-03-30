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

install_ngrok() {
	if [[ -e ".server/ngrok" ]]; then
		echo -e $red Ngrok already installed."
		echo -e $red Installing ngrok..."
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

dependencies
download_ngrok
install_ngrok
