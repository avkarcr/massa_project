# Massa Project install scripts
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
8. Generate password for Massa client (it's your choice to use the same password as for Massa node).
```
~/massa/massa-client/massa-client
```
