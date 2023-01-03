# Massa Project install scripts
## Procedure:
1. You need a new server with Ubuntu 20+ on server to install the node
2. Before you proceed with installation please run these commands:
```
apt install -y screen curl
screen -S install
```
3. Install the Massa node
```
curl -sLO https://raw.githubusercontent.com/avkarcr/massa_project/main/1_massa_install.sh && chmod +x 1_massa_install.sh
./1_massa_install.sh
```
