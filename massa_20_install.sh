echo
echo "==============================================================================================================================="
if ! screen -ls 2>/dev/null | grep -q "(Attached)"; then
echo "The good practice is to install the nodes inside the \"screen\" package."
echo "To do that type the following command BEFORE running this script (press ctrl+c now)."
echo
echo -e "\e[1;34msudo apt install screen -y && screen -S Massa_install\e[0m"
else
echo -e "\e[1;32mWELCOME TO MASSA INSTALLATION \e[0m"
echo
cat <<EOF
Please mind the following "screen" commands:
	"ctrl+a d" (hot key) 	- to continue running screen session in the background mode
        "screen -r"   		- to restore screen session from the background.
Please run "man screen" for more options.
EOF
fi
echo
echo "==============================================================================================================================="
echo
read -p "Type ENTER to continue or type type \"ctrl+c\" to exit." -es dummy
clear
echo -e "\e[1;33m--------------------------------------\e[0m"
echo -e "\e[1;33mCreate a password for your Massa node.\e[0m"
echo -e "\e[1;33m--------------------------------------\e[0m"
read -p "Highly recommended to use only letters [a-zA-Z] and numbers: " massa_pwd
echo
cp $HOME/.profile $HOME/.profile.bak
if [ -n "$massa_pwd" ]; then
	sed -i "/MASSA_PWD/d" $HOME/.profile
	echo "export MASSA_PWD=\"$massa_pwd\"" >> $HOME/.profile
	source $HOME/.profile
	sudo apt update && apt upgrade -y
	sudo apt install -y curl htop pkg-config git build-essential libssl-dev libclang-dev
	massa_version=$(curl -s "https://api.github.com/repos/massalabs/massa/releases/latest" | grep '"tag_name":' | sed  's/.*\(TEST..*\)\".*/\1/')
	wget -qO massa.tar.gz https://github.com/massalabs/massa/releases/download/$massa_version/massa_${massa_version}_release_linux.tar.gz &&  tar zxvf massa.tar.gz && rm -f massa.tar.gz
sudo tee <<EOF >/dev/null $HOME/massa/massa-node/config/config.toml
[network]
routable_ip = "$(curl ifconfig.me)"
EOF

sudo tee <<EOF >/dev/null /etc/systemd/system/massad.service
[Unit]
Description=Massa
After=network-online.target
[Service]
User=root
WorkingDirectory=$HOME/massa/massa-node
ExecStart=$HOME/massa/massa-node/massa-node -p "$MASSA_PWD"
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF
	#mkdir -p $HOME/massa_backup
	#cp $HOME/massa/massa-node/config/node_privkey.key $HOME/massa_backup/
	#cp $HOME/massa/massa-client/wallet.dat $HOME/massa_backup/
	sudo systemctl daemon-reload
	sudo systemctl enable massad
	sudo systemctl start massad
clear
echo -e "\e[1;32m-----------------------------------\e[0m"
echo -e "\e[1;32mYour Massa node has been installed!\e[0m"
echo -e "\e[1;32m-----------------------------------\e[0m"
echo
echo
echo -e "\e[1;32mTo proceed with node setup please follow steps on Github (Massa Node Setup section).\e[0m"
echo
else
	echo -e "\e[1;31m-------------------------------------------------------------------\e[0m"
	echo -e "\e[1;31mYou SHOULD create a password to move on with installation. Quiting!\e[0m"
	echo -e "\e[1;31m-------------------------------------------------------------------\e[0m"
fi
