#!/data/data/com.termux/files/usr/bin/bash

clear
echo "===================================="
echo " Minecraft Paper Server Installer"
echo " Termux Auto Setup"
echo "===================================="

sleep 2

echo ""
echo "[1] Updating Termux..."
pkg update -y && pkg upgrade -y

echo ""
echo "[2] Installing tools..."
pkg install curl wget jq nano -y

echo ""
echo "[3] Installing Java versions..."
pkg install openjdk-8 -y
pkg install openjdk-11 -y
pkg install openjdk-17 -y
pkg install openjdk-21 -y

echo ""
echo "Enter server folder name:"
read SERVERNAME

mkdir -p ~/$SERVERNAME
cd ~/$SERVERNAME

echo ""
echo "Enter Minecraft version"
echo "Example: 1.12.2  / 1.16.5  / 1.20.4"
read VERSION

echo ""
echo "Getting latest Paper build..."

BUILD=$(curl -s https://api.papermc.io/v2/projects/paper/versions/$VERSION | jq '.builds[-1]')

if [ "$BUILD" = "null" ]; then
echo "Version not found!"
exit
fi

echo "Latest build: $BUILD"

URL="https://api.papermc.io/v2/projects/paper/versions/$VERSION/builds/$BUILD/downloads/paper-$VERSION-$BUILD.jar"

echo ""
echo "Downloading Paper server..."
wget $URL -O server.jar

echo ""
echo "Select RAM size"

echo "1) 1GB"
echo "2) 2GB"
echo "3) 3GB"
echo "4) 4GB"
echo "5) 5GB"
echo "6) 6GB"
echo "7) 7GB"
echo "8) 8GB"
echo "9) 9GB"
echo "10) 10GB"

read RAMCHOICE

case $RAMCHOICE in
1) RAM="1G";;
2) RAM="2G";;
3) RAM="3G";;
4) RAM="4G";;
5) RAM="5G";;
6) RAM="6G";;
7) RAM="7G";;
8) RAM="8G";;
9) RAM="9G";;
10) RAM="10G";;
*) RAM="2G";;
esac

echo ""
echo "Creating start script..."

cat > start.sh <<EOF
#!/data/data/com.termux/files/usr/bin/bash
java -Xms$RAM -Xmx$RAM -jar server.jar nogui
EOF

chmod +x start.sh

echo ""
echo "Running server first time..."
java -jar server.jar

echo ""
echo "Accepting EULA..."
sed -i 's/eula=false/eula=true/g' eula.txt

echo ""
echo "Creating plugins folder..."
mkdir plugins

echo ""
echo "===================================="
echo " Server Installed Successfully"
echo "===================================="

echo ""
echo "Folder:"
echo "~/\$SERVERNAME"

echo ""
echo "Start server:"
echo "./start.sh"
