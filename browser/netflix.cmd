@echo off
set search=%1

echo Starting Netflix %search%

E:\Push2Run\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.netflix.com/"
timeout /T 3 > :NULL
start E:\Push2Run\browser\netflix.vbs
timeout /T 1 > :NULL
start E:\Push2Run\browser\close-tab.vbs
"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://www.netflix.com/search?q=%search%"
timeout /T 3 > :NULL
start E:\Push2Run\browser\netflix-search.vbs
