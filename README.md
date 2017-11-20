# Google Home With Windows

## Description

Here are multiple scripts &amp; Ideas to control your Windows PC with your Google Home (Mini) or your Google Assistant on Android/iPhone.
Some Main Features are:
- Shutdown/Reboot/Hibernate the PC
- Change Volume of PC
- Open Soundcloud/Netflix
- Pause Soundcloud/Netflix/YouTube/...
- Skip Track on Soundcloud
- Close Tab on Chrome

and this all is being archieved via your Google Home /Assistant


## How to Install

- Download the whole Project from here: https://github.com/FaserF/GoogleHomeWithWindows/archive/master.zip
- Extract it and copy all files within to C:\Scripts (It is important to use this path! Other paths wont work!)
- Open Powershell in Administrator Mode and type in "set-executionpolicy -executionpolicy unrestricted" (this is to make our PS file executable on newer Windows Versions!)
- Open the Powershell Script "GoogleHome.ps1" and modify it as you want and need
- Open IFTTT on your Browser and configure it to your needs (important is here to use the correct file name)
See a example config here: http://prntscr.com/hcxfer (the file names are the following: "shutdown", "reboot", "hibernate", "soundcloud", "louder", "quieter", and so on)
- Now say "Okay Google (your sentence from IFTTT here)" and see if it responds. Your PC wont do anything right now, thats correct!
- Open task scheduler on windows configure as in this video: https://youtu.be/gOt1IyEAIxA?t=2m8s (important is in the last step to name it in arguments "C:\Scripts\GoogleHome.ps1"
- Reboot your PC
- Now test it by saying "Okay Google ..."

## Probleme / Q&A

Q: Dropbox has created the file.txt but my pc doesnt do anything -_-
A: Did you entered the following command in Powershell Administrator? "set-executionpolicy -executionpolicy unrestricted"

If you have further issues open a new Issue on GitHub!