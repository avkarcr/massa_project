echo
echo "==============================================================================================================================="
echo "There is a good practice to install the node under the Screen."
echo "To do that type \"screen -S install\" BEFORE running this script."
echo "You can always hide the current screen by typing \"ctrl+a d\" (during install process)."
echo
echo "After install you will be asked for a password."
echo "After typing the password press \"ctrl+a d\" to hide the log output and return to the terminal."
echo
echo "To continue type ENTER or type type \"ctrl+c\" to exit."
echo "==============================================================================================================================="
echo
read -p "Type ENTER to continue..." dummy
apt update && apt upgrade -y
apt install -y curl htop pkg-config git build-essential libssl-dev libclang-dev
massa_version=$(curl -s "https://api.github.com/repos/massalabs/massa/releases/latest" | grep '"tag_name":' | sed  's/.*\(TEST..*\)\".*/\1/')
wget -qO massa.tar.gz https://github.com/massalabs/massa/releases/download/$massa_version/massa_${massa_version}_release_linux.tar.gz &&  tar zxvf massa.tar.gz
sudo tee <<EOF >/dev/null $HOME/massa/massa-node/config/config.toml
[network]
routable_ip = "$(curl ifconfig.me)"
EOF
cd ~/massa/massa-node
