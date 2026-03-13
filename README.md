# 🇰🇭 Siem Reap Kh - Multi-Purpose Tool Suite

A comprehensive collection of tools for video downloading, Minecraft server automation, and web-based media management.

---
# Termux link download 

## https://github.com/termux/termux-app/tags

## 📋 Project Overview

This project includes:
- **Minecraft Bot Automation** (bot.js) - Automated bots for Minecraft server interaction
- **Video Downloader** (webnet.py) - Web interface for downloading videos from YouTube, TikTok, Instagram, X
- **Shell Setup Scripts** (run.sh, s.sh) - Environment setup for Termux/Android
- **Video Download CLI** (video.sh) - Command-line video downloader

---

## 🚀 Quick Start

### Prerequisites
- Android device with Termux installed
- Internet connection
- ~2GB free storage

### Installation

Run the setup script:

```bash
bash run.sh
```

Or use the optimized version with less output:

```bash
bash s.sh
```

---

## 📁 Files Description

### `bot.js` - Minecraft Bot Automation
Automated bot that connects to a Minecraft server and performs random movements.

**Features:**
- Connects 10 bots simultaneously
- Random walking patterns
- Auto-reconnection on disconnect
- 10-minute session duration

**Usage:**
```bash
node bot.js
```

**Configuration:**
```javascript
const HOST = '127.0.0.1'      // Server IP
const PORT = 25565             // Server Port
const VERSION = '1.12.2'       // Minecraft Version
const BOT_COUNT = 10          // Number of bots
const STAY_TIME = 10 * 60 * 1000  // Session duration
```

---

### `webnet.py` - Web Video Downloader
Full-featured web interface for downloading videos with multiple format options.

**Features:**
- 🌐 Web-based UI (http://localhost:8080)
- Multiple video quality options (144p - 1080p)
- Support for YouTube, TikTok, Instagram, X
- Real-time download statistics
- Video preview functionality
- Download folder management
- Khmer language support 🇰🇭

**Usage:**
```bash
python webnet.py
```

**Access:** http://localhost:8080 or http://[your-ip]:8080

**Features:**
- Resolution selection (144p, 240p, 360p, 480p, 720p, 1080p)
- Video preview before download
- Download speed and time tracking
- File size display
- Browse downloads folder

---

### `video.sh` - CLI Video Downloader
Command-line tool for batch downloading videos.

**Features:**
- Background download processing
- Quality optimization (720p default)
- Saves to `/storage/emulated/0/Movies`
- Supports loop mode for multiple downloads

**Usage:**
```bash
bash video.sh
```

**Supported Sites:**
- YouTube
- TikTok
- Instagram
- Any yt-dlp supported platform

---

### `run.sh` - Full Setup Script
Comprehensive installation script for setting up the entire environment.

**Installs:**
- Python 3 and modules (flask, yt-dlp)
- Node.js and npm packages (mineflayer)
- FFmpeg for video processing
- Git, tmux, wget, unzip
- Cloudflared for tunneling
- Fish shell

**Usage:**
```bash
bash run.sh
```

---

### `s.sh` - Optimized Setup Script
Faster, cleaner version of run.sh with output suppression.

**Usage:**
```bash
bash s.sh
```

---

## ⚙️ Configuration

### Minecraft Bot Settings
Edit bot.js:
```javascript
const HOST = 'your-server-ip'
const PORT = 25565
const BOT_COUNT = 10  // Adjust bot count
const STAY_TIME = 10 * 60 * 1000  // Adjust duration
```

### Video Downloader Settings
Edit webnet.py:
```python
DOWNLOAD_FOLDER = os.path.join(os.getcwd(), "downloads")  // Change download location
app.run(host='0.0.0.0', port=8080)  // Change port
```

---

## 📊 Usage Examples

### Run Minecraft Bots
```bash
node bot.js
# Output: Dream1234 joined
# Output: Technoblade5678 joined
# ...
```

### Download Video via Web
1. Navigate to http://localhost:8080
2. Enter video URL
3. Select resolution
4. Click "⚡ Download"
5. View or download from "📂 មើលឯកសារ Downloads"

### Download Video via CLI
```bash
bash video.sh
# Enter video URL when prompted
# Video downloads in background to ~/Movies
```

---

## 🔧 Troubleshooting

### Port Already in Use
```bash
# Change port in webnet.py or kill existing process
lsof -ti :8080 | xargs kill -9
```

### FFmpeg Not Found
```bash
pkg install ffmpeg
```

### yt-dlp Issues
```bash
pip install --upgrade yt-dlp
```

### Minecraft Connection Failed
- Verify server IP and port
- Check network connectivity
- Ensure Minecraft server is running

---

## 📦 Dependencies

**Node.js:**
- mineflayer

**Python:**
- flask
- yt-dlp

**System:**
- ffmpeg
- git
- python3
- nodejs/npm
- tmux (optional)
- cloudflared (optional)

---

## 🌐 Hosting Options

### Local Access
```
http://127.0.0.1:8080
```

### Network Access
```
http://[your-device-ip]:8080
```

### Via Cloudflared (Public)
```bash
cloudflared tunnel --url http://localhost:8080
```

---

### run.sh (nano run.sh)
```bash
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

```

---

## chmod +x run.sh
```bash
./run.sh
```
---

### 🎬 video.sh (nano video.sh) 
```bash
#!/bin/bash

DOWNLOAD_FOLDER="/storage/emulated/0/Movies"

mkdir -p "$DOWNLOAD_FOLDER"

echo "🎬 Multi Video Downloader (press CTRL+C to exit)"

while true; do
    read -p "Enter video URL: " url

    if [[ -z "$url" ]]; then
        echo "⚠️ No URL entered, try again..."
        continue
    fi

    echo "⬇️ Downloading $url in background..."

    yt-dlp \
        -f "bestvideo[height<=720][ext=mp4][fps<=60]+bestaudio[ext=m4a>
        --merge-output-format mp4 \
        -S "vcodec:h264,lang,quality,res,fps,hdr:12,acodec:aac" \
        -o "$DOWNLOAD_FOLDER/%(title)s.%(ext)s" \
        "$url" &

    echo "✅ Download started! Video will be saved in Movies folder."
done
ved in Movies folder."
done

```

---

## chmod +x video.sh
```bash
./video.sh
```
---


## 📝 Notes

- This project is designed for Termux/Android environments
- Ensure adequate storage before downloading large videos
- Bot sessions automatically reconnect
- Videos are stored in the downloads/ folder
- All timestamps and speeds are calculated in real-time

---

## ⚠️ Important

- Respect platform ToS when downloading videos
- Use responsibly
- Check local laws regarding video downloading
- Ensure server owner permission for bot automation

---

## 🇰🇭 ភាសាខ្មែរ

**កម្មវិធីមូលដ្ឋាន:**
- ទាញយកវីដេអូពី YouTube, Tik tok , Facebook 
- run bot join server Minecraft ដោយស្វ័យប្រវត្ត
- ឧបករណ៍ដូចម៉ាក់ក្នុងឡើងលើ

---

## 📞 Support

For issues or questions, check:
1. README.md in repository
2. Official documentation for dependencies
3. GitHub issues

---

**Last Updated:** 2026-03-12
**Author:** Sochamroun
**License:** See LICENSE file
