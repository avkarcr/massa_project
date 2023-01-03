# Massa Project install scripts
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
5. Run the Massa node to create a password.
After running type "ctrl+c" to stop the node and continue installation.
```
./2_massa_create_pwd.sh
```
6. Create the Massa node service. You will be asked for a password which you created earlier in step 5.
After you see runnning node logs, exit the screen by typing "ctrl+a d".
You can always return to logs by typing "screen -r".
```
./3_massa_create_service.sh
```
