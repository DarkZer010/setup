#!/data/data/com.termux/files/usr/bin/bash

# 🔄 Atualiza os pacotes
pkg update -y
pkg upgrade -y

# 📂 Solicita acesso ao armazenamento interno
termux-setup-storage

# 🧰 Instala pacotes essenciais para hacking
pkg install -y nmap
pkg install -y whois
pkg install -y iproute2
pkg install -y python3
pkg install -y php

# 🐍 Instala bibliotecas Python úteis
pip install requests
pip install pyfiglet
pip install colorama
pip install flask

echo "✅ Ambiente Termux configurado com sucesso!"
