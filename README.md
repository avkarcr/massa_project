# Massa Project install scripts (valid for 19.x episode)
## If you update the Massa node - save your backup files:
```
mkdir -p ~/massa_backup
cp ~/massa/massa-node/config/node_privkey.key ~/massa_backup/node_privkey.key
cp ~/massa/massa-client/wallet.dat ~/massa_backup/wallet.dat
```
## To delete the node (don't forget to backup) use these commands:
```
cd ~
systemctl stop massad
systemctl disable massad
rm -rf ~/massa
rm -f massa.tar.gz
```
## Procedure:
1. You need a new server with Ubuntu 20+ on server to install the node
2. Before you proceed with installation please run these commands:
```
apt install -y screen curl
screen -S install
```
3. Load the scripts for further installation.
```
curl -sLO https://raw.githubusercontent.com/avkarcr/massa_project/main/1_massa_install.sh && chmod +x 1_massa_install.sh
curl -sLO https://raw.githubusercontent.com/avkarcr/massa_project/main/2_massa_create_pwd.sh && chmod +x 2_massa_create_pwd.sh
curl -sLO https://raw.githubusercontent.com/avkarcr/massa_project/main/3_massa_create_service.sh && chmod +x 3_massa_create_service.sh
```
4. Install the Massa node.
```
./1_massa_install.sh
```
5. **If you update** the node - copy your backup files to the node directory.
```
cp ~/massa_backup/node_privkey.key ~/massa/massa-node/config/node_privkey.key
cp ~/massa_backup/wallet.dat ~/massa/massa-client/wallet.dat
```
6. Run the Massa node to create a password.
After running type "ctrl+c" to stop the node and continue installation.
```
./2_massa_create_pwd.sh
```
7. Create the Massa node service. You will be asked for a password which you created earlier in step 5.
After you see runnning node logs, exit the screen by typing "ctrl+a d".
You can always return to logs by typing "screen -r".
```
./3_massa_create_service.sh
```
8. Generate password for Massa client (if you're **updating** your node - use your old password).
```
cd ~/massa/massa-client
./massa-client
```
9a. **Steps for an UPDATE** (for new install go to step 9b).
- write down your **address** (replace *YOUR_ADDRESS* by your data here below) from:
```
wallet_info
```
- add staking
```
node_start_staking YOUR_ADDRESS
 ```
- get some test tokens **from Discord channel "testnet-faucet"** by simply typing (in Discord!):
```
YOUR_ADDRESS
```
- send to Massa bot (in Discord!):
Check your DISCORD_ID in the Massa bot dialog
```
node_testnet_rewards_program_ownership_proof YOUR_ADDRESS YOUR_DISCORD_ID
```
You will receive the hash-string. Send this string to the Massa-bot in Discord.
Bot will tell you "your discord account has been associated with this node ID".
- send your IP-address to Massa-bot (in Discord!)
you can take your IP-address from the output (run from terminal):
```
wget -qO- eth0.me
```
- return to the **massa-client** and buy some rolls (you should **WAIT** for the test tokens to come to your wallet - check balance by `wallet_info`)
If the faucet is broken it may take an hour or more. It the faucet is working it will take seconds.
```
buy_rolls YOUR_ADDRESS 1 0
```
9b. **Steps for a new install**
Type these commands from inside the massa-client:
- generate your secret keys
```
wallet_generate_secret_key
```
- write down your **address** and **secret key** (replace *YOUR_SECRET_KEY* and *YOUR_ADDRESS* by your data here below) from:
```
wallet_info
```
- add secret key staking
```
node_add_staking_secret_keys YOUR_SECRET_KEY
 ```
- get some test tokens **from Discord channel "testnet-faucet"** by simply typing (in Discord!):
```
YOUR_ADDRESS
```
- start your conversation with Massa bot **from Discord channel "testnet-rewards-registration"** by simply typing (in Discord!):
```
Hi! :) (or anything else - doesn't matter)
```
After that you will see the Massa bot dialog in your Discord personal chats.
Read carefully. You shoud see a **template** for your massa-client (YOUR_DISCORD_ID):
**node_testnet_rewards_program_ownership_proof YOUR_ADDRESS YOUR_DISCORD_ID**
- copy the string above (with your address and discord_id) to the **massa-client**:
```
node_testnet_rewards_program_ownership_proof YOUR_ADDRESS YOUR_DISCORD_ID
```
You will receive the hash-string. Send this string to the Massa-bot in Discord.
Bot will tell you "your discord account has been associated with this node ID".
- send your IP-address to Massa-bot (in Discord!)
you can take your IP-address from the output (run from terminal):
```
wget -qO- eth0.me
```
- return to the **massa-client** and buy some rolls (you should **WAIT** for the test tokens to come to your wallet - check balance by `wallet_info`)
If the faucet is broken it may take an hour or more. It the faucet is working it will take seconds.
```
buy_rolls YOUR_ADDRESS 1 0
```
