# This project is Obsolete, as http://www.push2run.com/setup.html is doing it better.


# Control your PC with you Voice
## Works with Alexa (Amazon Echo, Dot) & Google Assistant (Google Home, Mini, Android, iPhone)

## Description

Here are multiple scripts &amp; Ideas to control your Windows PC with your Alexa, Google Home (Mini) or your Google Assistant on Android/iPhone.
Some Main Features are:
- Shutdown/Reboot/Hibernate the PC
- Change Volume of PC
- Open Soundcloud/Netflix
- Pause Soundcloud/Netflix/YouTube/...

Planned features/Work in Progress:
- Skip Track on Soundcloud
- Close Tab on Chrome

and this all is being archieved via your Voice


## How to Install

- Download the whole Project from here: https://github.com/FaserF/GoogleHomeWithWindows/archive/master.zip
- Extract it and copy all files within to C:\Scripts (It is important to use this path! Other paths wont work!)
- Open Powershell in Administrator Mode and type in "set-executionpolicy -executionpolicy unrestricted" (this is to make our PS file executable on newer Windows Versions!)
- Open the Powershell Script "VoiceControl.ps1" and modify it as you want and need
- Edit VoiceControl.ps1 line 15 ($SearchDirectory = "C:\Users\%username%\Dropbox\IFTTT") and edit %username% to your username
- Open IFTTT in your Browser and configure it to your needs (important is here to use the correct file name)
See a example config here: http://prntscr.com/hcxfer (the file names are the following: "shutdown", "reboot", "hibernate", "soundcloud", "louder", "quieter", and so on)
- Now say "Okay Google (your sentence from IFTTT here)" and see if it responds. Your PC wont do anything right now, thats correct!
- Open task scheduler on windows configure as in this video: https://youtu.be/gOt1IyEAIxA?t=2m8s (important is in the last step to name it in arguments "C:\Scripts\VoiceControl.ps1"
- Reboot your PC
- Now test it by saying "Okay Google ..." or "Alexa ..."
- Add more features to IFTTT so your Voice can control it

## Issues / Q&A

Q: Dropbox has created the file.txt but my pc doesnt do anything -_-
A: Did you entered the following command in Powershell Administrator? "set-executionpolicy -executionpolicy unrestricted"

Q: I am getting an error that the password is wrong for the task scheduled script on every reboot
A: Have you entered the correct password in task scheduler? Try readding the task in task scheduler.

If you have further issues open a new Issue on GitHub!

## Credits
Credits go to 
- Hylke Jellema from YouTube for his base script and his instruction video: https://www.youtube.com/watch?v=gOt1IyEAIxA
- NirCMD for making CMD much more comfortable
