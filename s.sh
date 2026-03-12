#!/data/data/com.termux/files/usr/bin/bash

echo "📦 Updating packages..."
yes | pkg update -y > /dev/null 2>&1
yes | pkg upgrade -y > /dev/null 2>&1

echo "📥 Installing packages..."
yes | pkg install python ffmpeg git tmux wget unzip iproute2 libqrencode cloudflared fish nodejs -y > /dev/null 2>&1

echo "🐍 Installing Python modules..."
pip install flask yt-dlp > /dev/null 2>&1

echo "📦 Installing Node modules..."
npm init -y > /dev/null 2>&1
npm install mineflayer > /dev/null 2>&1
npm audit fix > /dev/null 2>&1
npm audit fix --force > /dev/null 2>&1

echo "🐟 Changing shell to fish..."
chsh -s fish > /dev/null 2>&1

