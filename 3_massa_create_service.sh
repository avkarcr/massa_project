echo
read -p "Type your Massa password: " massa_password
echo "export massa_password=$massa_password" >> ~/.profile
source ~/.profile
printf "[Unit]
Description=Massa Node
After=network-online.target
[Service]
User=$USER
WorkingDirectory=$HOME/massa/massa-node
ExecStart=$HOME/massa/massa-node/massa-node -p $massa_password
Restart=on-failure
RestartSec=3
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target" > /etc/systemd/system/massad.service
systemctl daemon-reload
systemctl enable massad
systemctl restart massad
journalctl -u massad -f
