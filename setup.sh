#!/data/data/com.termux/files/usr/bin/bash

set -e

clear
echo "[*] Starting Termux setup..."

read -p "Enter your future username: " USERNAME

echo "[*] Updating system..."
pkg update -y && pkg upgrade -y

termux-setup-storage

echo "[*] Installing basic packages..."
pkg install -y figlet lolcat git micro curl wget

clear
echo "Select your user type:"
echo "[1] Hacker (offensive cybersecurity)"
echo "[2] Web Developer"

read -p "> " TYPESETUP

case "$TYPESETUP" in
  1)
    echo "[*] Installing hacker toolkit..."

    pkg install -y python php nodejs sqlite nmap whois dnsutils hydra dirb

    mkdir -p ~/tools ~/laboratory

    cd ~/tools
    git clone https://github.com/sqlmapproject/sqlmap
    git clone https://github.com/lanmaster53/recon-ng
    git clone https://github.com/aboul3la/Sublist3r
    git clone https://github.com/voidh7/Logger-hell

    cd ~/laboratory
    git clone https://github.com/omerbenamram/VulnerablePHP
    git clone https://github.com/juice-shop/juice-shop
    git clone https://github.com/LukaTheBrave/dvwa-lit
    ;;
    
  2)
    echo "[*] Installing web dev environment..."

    pkg install -y python nodejs
    mkdir -p ~/projects
    ;;
    
  *)
    echo "[!] Invalid option. Exiting."
    exit 1
    ;;
esac

echo "[*] Configuring shell..."

cat <<EOF >> ~/.bashrc

clear
figlet "Welcome back" | lolcat
export PS1="[$USERNAME@termux \\W]\\$ "

EOF

echo
echo "[✓] Termux environment configured successfully."
