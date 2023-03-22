# Massa Project Install and Update scripts (valid for 20.x episode)
## To delete the node (don't forget to backup) use these commands:
```
cd ~
systemctl stop massad
systemctl disable massad
rm -rf ~/massa
```
## UPDATE (any version 20.x):
1. Load the script.
```
sudo apt update && sudo apt install curl -y && curl -sLO https://raw.githubusercontent.com/avkarcr/massa_project/main/massa_20_update.sh && chmod +x massa_20_update.sh
```
2. Run the script.
```
./massa_20_update.sh
```
3. Follow the instructions in *Massa Node Setup* section below.
## Installation:
1. You need a new server with Ubuntu 20+ on server to install the node
2. Load the script for further installation.
```
curl -sLO https://raw.githubusercontent.com/avkarcr/massa_project/main/massa_20_install.sh && chmod +x massa_20_install.sh
```
3. Install the Massa node.
```
./massa_20_install.sh
```
## Massa Node Setup:
1. Run command to follow the node logs:
```
journalctl -u massad.service -f | grep final_state
```
**PLEASE WAIT** a couple of minutes until you begin to catch messages with RED "final state" text.

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

6. **[ONLY FOR INSTALL]** You will see the message that "your wallet does not contain any key".
That's ok. For the Episode 20 we must generate a new key.

In the client terminal run:
```
wallet_generate_secret_key
```
You will see YOUR_ADDRESS string. Copy it somewhere.

7. In the client terminal:
```
node_start_staking YOUR_ADDRESS
```
8. In the Discord: send YOUR_ADDRESS to "testnet-faucet" discord channel".

9. In the client terminal:
```
node_testnet_rewards_program_ownership_proof YOUR_ADDRESS YOUR_DISCORD_ID
```
It will connect your address and your Discord ID. You will receive a hash string as an answer.

10. In the Discord: send the hash string from step 10 to your MassaBot. Bot will be happy. And you too, but maybe later )

11. Get your IP-address. Type in the Linux terminal:
```
wget -qO- eth0.me
```
12. In the Discord: send your IP-address to the MassaBot

13. Repeat step 4 and wait for your balance to fill up with some coins.

14. In the client terminal:
```
buy_rolls YOUR_ADDRESS 1 0
```

That's all!

## If you did something wrong or accidentally generated a new key during update process, you may restore your keys from massa_backup folder:
```
systemctl stop massad > /dev/null
cp $HOME/massa_backup/node_privkey.key $HOME/massa/massa-node/config/
cp $HOME/massa_backup/wallet.dat $HOME/massa/massa-client/
systemctl start massad > /dev/null
```

# [РУССКИЙ ЯЗЫК] Установка и обновление ноды Massa версии 20.х
## Для удаления ноды (помним про своевременные бекапы!) введите эти команды:
```
cd ~
systemctl stop massad
systemctl disable massad
rm -rf ~/massa
```
## Инструкция по ОБНОВЛЕНИЮ (для любой подверсии 20.x):
1. Скачиваем скрипт.
```
curl -sLO https://raw.githubusercontent.com/avkarcr/massa_project/main/massa_20_update.sh && chmod +x massa_20_update.sh
```
2. Запускаем скрипт.
```
./massa_20_update.sh
```
3. Следуем инструкциям в разделе "Настройка ноды Massa".

## Инструкция по УСТАНОВКЕ (ВНИМАНИЕ! Для **обновления** ноды читайте пункты выше):
1. Вам нужен сервер с ОС Ubuntu 20+.
2. Скачиваем скрипт для первой установки ноды.
```
curl -sLO https://raw.githubusercontent.com/avkarcr/massa_project/main/massa_20_install.sh && chmod +x massa_20_install.sh
```
3. Запусаем скрипт.
```
./massa_20_install.sh
```
## Настройка ноды Massa:
1. Вводим команду для просмотра логов. И ждем. Сначала на экране ничего не отобразится. Ждем!
```
journalctl -u massad.service -f | grep final_state
```
**ЖДЕМ** пару минут, пока на экране не начнут бежать строки с красным текстом "final_state". Строки красные, но это ХОРОШО, ничего не боимся.

2. Теперь (когда видим, что побежали красные строки final_state) жмем ctrl+c и выходим из режима просмотра логов.

3. Теперь запускаем клиент ноды Massa.
```
cd ~/massa/massa-client
./massa-client
```
4. Вводим в **клиенте Massa** (**Внимание!** В пунктах ниже некоторые команды надо будет вводить в этот самый клиент. Для того, чтобы понять, что в вы находитесь в клиенте (а не в терминале Linux) обращайте внимание на приглашение командной строки клиента Massa в виде **command >**. Если видите это приглашение, то вы в клиенте Massa):
```
wallet_info
```
5. Придумываем пароль для кошелька Massa (можно использовать такой же пароль, как для ноды - на ваш выбор).

6. **[Этот пункт только для первой установки]** Мы видим надпись "your wallet does not contain any key".
Это нормально. Для эпизода 20 Massa надо сгенерировать новый ключ. Что и сделаем:
```
wallet_generate_secret_key
```
Видим на экране свой адрес Massa, ниже по тексту заменяем YOUR_ADDRESS на этот адрес.

7. Вводим в **клиенте Massa**
```
node_start_staking YOUR_ADDRESS
```
8. Вводим в **Discord**: отправьте строку YOUR_ADDRESS в канал "testnet-faucet" сервера Massa.

9. Вводим в **клиенте Massa** (предполагается, что вы знаете свой Discord ID - строка с цифрами, длиною 18 символов):
```
node_testnet_rewards_program_ownership_proof YOUR_ADDRESS YOUR_DISCORD_ID
```
После этой команды вы получите "длинную строку с символами".

10. Вводим в **Discord**: отправляем полученную из клиента Massa "длинную строку с символами" боту Massa (найдите бота в личных сообщениях Discord).

11. Выясните свой IP-адрес. Можете для этого использовать команду (в терминале Линукс):
```
wget -qO- eth0.me
```
12. Вводим в **Discord**: отправляем IP-адрес боту Massa.

13. Повторяем шаг 4, смотрим вывод и ждем, когда тестовые монетки капнут на кошелек.

14. Вводим в **клиенте Massa**:
```
buy_rolls YOUR_ADDRESS 1 0
```

На этом считаем, что нода установлена и работает. Проверяем время от времени баланс роллов (по команде wallet_info клиента Massa). Если количество роллов станет равным нулю, то повторяем шаг 14.


## Если вы случайно сгенерировали новый ключ при **обновлении** ноды (это пункт 6, который был *только для установки*), то можно восстановить бекап с помощью следующих команд:
```
systemctl stop massad > /dev/null
cp $HOME/massa_backup/node_privkey.key $HOME/massa/massa-node/config/
cp $HOME/massa_backup/wallet.dat $HOME/massa/massa-client/
systemctl start massad > /dev/null
```
И после восстановления заново пройти все шаги раздела "Настройка ноды Massa"
