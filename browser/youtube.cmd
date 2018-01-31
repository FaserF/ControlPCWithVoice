@echo off
set search=%1

echo Starting YouTube %search%

E:\Push2Run\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.youtube.com/results?search_query=%search%"
timeout /T 3 > :NULL
start E:\Push2Run\browser\youtube-search.vbs
