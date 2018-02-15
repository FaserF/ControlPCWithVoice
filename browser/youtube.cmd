@echo off
set search=%1
set search2=%2
set search3=%3

echo Starting YouTube %search%

E:\Push2Run\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.youtube.com/results?search_query=%search%+%search2%+%search3%"
timeout /T 3 > :NULL
start E:\Push2Run\browser\youtube-search.vbs
