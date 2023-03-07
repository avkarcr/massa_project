# Massa Project install scripts (valid for 20.x episode)
## To delete the node (don't forget to backup) use these commands:
```
cd ~
systemctl stop massad
systemctl disable massad
rm -rf ~/massa
```
## Procedure:
1. You need a new server with Ubuntu 20+ on server to install the node
2. Load the script for further installation.
```
curl -sLO https://raw.githubusercontent.com/avkarcr/massa_project/main/massa_20_install.sh && chmod +x massa_20_install.sh
```
3. Install the Massa node.
```
./massa_20_install.sh
```
## Massa node setup:
1. Run command to follow the node logs:
```
journalctl -u massad.service -f | grep final_state
```
**PLEASE WAIT** a couple of minutes until you begin to catch messages with RED "final state" text
2. Press ctrl+c to exit logs.
3. Run Massa client terminal:
```
cd ~/massa/massa-client
./massa-client
```
4. In the client terminal:
```
wallet_info
```
5. Invent (or use your current one) a password for the client.
6. If you succeed you will see the message that "your wallet does not contain any key".
That's ok. For the Episode 20 we must generate a new key.
7. In the client terminal:
```
wallet_generate_secret_key
```
You will YOUR_ADDRESS string. Copy it somewhere.
8. In the client terminal:
```
node_start_staking YOUR_ADDRESS
```
9. In the Discord: send YOUR_ADDRESS to "testnet-faucet" discord channel".
10. In the client terminal:
```
node_testnet_rewards_program_ownership_proof YOUR_ADDRESS YOUR_DISCORD_ID
```
It will connect your address and your Discord ID. You will receive a hash string as an answer.
11. In the Discord: send the hash string from step 10 to your MassaBot. Bot will be happy. And you too, but maybe later )
12. Get your IP-address. Type in the Linux terminal:
```
wget -qO- eth0.me
```
13. In the Discord: send your IP-address to the MassaBot
14. Repeat step 4 and wait for your balance to fill up with some coins.
15. In the client terminal:
```
buy_rolls YOUR_ADDRESS 1 0
```

That's all!
