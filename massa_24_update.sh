echo
echo -e "\e[1;32mWELCOME TO MASSA UPDATE \e[0m"
echo
echo "Please remember to do all your backups locally."
echo "I hope you save all your sensible data manually. If you aren't sure - please press ctrl+c and re-check."
echo
read -p "Type ENTER to continue or type \"ctrl+c\" to exit." -es dummy
clear
systemctl stop massad
mkdir -p ~/massa_backup
cp $HOME/massa/massa-node/config/node_privkey.key $HOME/massa_backup
cp $HOME/massa/massa-client/wallet.dat $HOME/massa_backup
rm -rf $HOME/massa/
sudo apt update && apt upgrade -y
massa_version=$(curl -s "https://api.github.com/repos/massalabs/massa/releases/latest" | grep '"tag_name":' | sed  's/.*\(TEST..*\)\".*/\1/')
wget -qO massa.tar.gz https://github.com/massalabs/massa/releases/download/$massa_version/massa_${massa_version}_release_linux.tar.gz &&  tar zxvf massa.tar.gz && rm -f massa.tar.gz
sudo tee <<EOF >/dev/null $HOME/massa/massa-node/config/config.toml
[protocol]
routable_ip = "$(curl ifconfig.me)"
EOF
cp ~/massa_backup/node_privkey.key ~/massa/massa-node/config/node_privkey.key
cp ~/massa_backup/wallet.dat ~/massa/massa-client/wallet.dat
#sudo systemctl daemon-reload
#sudo systemctl enable massad
sudo systemctl start massad
clear
echo -e "\e[1;32m-----------------------------------\e[0m"
echo -e "\e[1;32mYour Massa node has been updated!\e[0m"
echo -e "\e[1;32m-----------------------------------\e[0m"
echo
echo
echo -e "\e[1;32mPlease follow further steps on Github.\e[0m"
echo
