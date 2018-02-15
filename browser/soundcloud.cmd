@echo off
echo "Starting Soundcloud..."
E:\Push2Run\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" https://soundcloud.com
timeout /T 3
start E:\Push2Run\browser\soundcloud.vbs
