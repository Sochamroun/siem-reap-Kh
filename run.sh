#!/data/data/com.termux/files/usr/bin/bash

yes | pkg update
yes | pkg upgrade

yes | pkg install python ffmpeg git
yes | pkg install tmux
yes | pkg install wget
yes | pkg install unzip
yes | pkg install iproute2
yes | pkg install libqrencode
yes | pkg install cloudflared
yes | pkg install fish
yes | pkg install nodejs

pip install flask yt-dlp

npm init -y
npm install mineflayer
npm audit fix
npm audit fix --force

chsh -s fish

echo "✅ Setup Complete!"rc

echo "✅ All done!"
echo "Test with: yt-dlp --version"
