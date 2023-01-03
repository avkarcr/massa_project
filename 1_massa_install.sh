echo
echo "==============================================================================================================================="
echo "There is a good practice to install the node under the Screen."
echo "To do that type \"screen -S install\" BEFORE running this script."
echo "You can always hide the current screen by typing \"ctrl+a d\" (during install process)."
echo
echo "To continue type a PASSWORD for your Massa node (save your password manually) and press enter OR type type \"ctrl+c\" to exit."
echo "==============================================================================================================================="
echo
read -p "Type your Massa password: " massa_password
echo "export massa_password=\"$massa_password\"" >> ~/.bashrc
source ~/.bashrc
apt update && apt upgrade -y
apt install -y curl htop pkg-config git build-essential libssl-dev libclang-dev-y
massa_version=$(curl -s "https://api.github.com/repos/massalabs/massa/releases/latest" | grep '"tag_name":' | sed  's/.*\(TEST..*\)\".*/\1/')
wget -qO massa.tar.gz https://github.com/massalabs/massa/releases/download/$massa_version/massa_${massa_version}_release_linux.tar.gz &&  tar zxvf massa.tar.gz
sudo tee <<EOF >/dev/null $HOME/massa/massa-node/config/config.toml
[network]
routable_ip = "$(curl ifconfig.me)"
EOF
ln -s ~/massa/massa-node/massa-node /usr/bin/massa-node
#ln -s ~/massa/massa-node/massa-client /usr/bin/massa-client
massa-node -p $massa_password
