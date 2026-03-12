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
        -f "bestvideo[height<=720][ext=mp4][fps<=60]+bestaudio[ext=m4a]/mp4" \
        --merge-output-format mp4 \
        -S "vcodec:h264,lang,quality,res,fps,hdr:12,acodec:aac" \
        -o "$DOWNLOAD_FOLDER/%(title)s.%(ext)s" \
        "$url" &

    echo "✅ Download started! Video will be saved in Movies folder."
done
ved in Movies folder."
done
