#Control PC by Voice - V0.4.2
#Will work with Alexa and Google Assistant

#This script is obsolete!!! Use push2run now!!! http://www.push2run.com/setup.html

# -------------------------------------------------------------------------------------------
#CREDITS Go to: Hylke Jellema (https://www.youtube.com/watch?v=gOt1IyEAIxA&feature=youtu.be)
#Script optimized & new features added by FaserF (https://github.com/FaserF/ControlPCWithVoice)
# -------------------------------------------------------------------------------------------
#IMPORTANT: If the script wont work insert the following line in powershell (Administrator): 
#set-executionpolicy -executionpolicy unrestricted
#Issues? Open a Ticket here: https://github.com/FaserF/ControlPCWithVoice/issues
# -------------------------------------------------------------------------------------------

cd C:\Scripts
#Declaring Variables
$SearchDirectory = "C:\Users\fabia\Dropbox\IFTTT"
$SleepTime = 5

#Sleep for 30 Seconds before being active (to prevent boot loops if the file for some reason is not deleted)
Start-Sleep -Seconds 30
#Removing old commands, to prevent rebooting on start etc.
Remove-Item -Path "$SearchDirectory\*.txt"

#Loop checking to see if the file has been created and once it has it continues on. Sleep in the look to prevent CPU pegging
Do {
Start-Sleep -Seconds $SleepTime
$shutdown = Test-Path -Path "$SearchDirectory\shutdown.txt"
$reboot = Test-Path -Path "$SearchDirectory\reboot.txt"
$hibernate = Test-Path -Path "$SearchDirectory\hibernate.txt"
#$pause = Test-Path -Path "$SearchDirectory\pause.txt"
$louder = Test-Path -Path "$SearchDirectory\louder.txt"
$quieter = Test-Path -Path "$SearchDirectory\quieter.txt"
#$soundcloud = Test-Path -Path "$SearchDirectory\soundcloud.txt"
}
Until ($shutdown -eq $True -or $reboot -eq $True -or $hibernate -eq $True -or $louder -eq $True -or $quieter -eq $True)
#-or $pause -eq $True -or $soundcloud-next -eq $True -or $soundcloud -eq $True)

#Shutdown
if ($shutdown -eq $True) {
#Removes the shutdown file to prevent an imediate shutdown when the computer starts back up
Remove-Item -Path "$SearchDirectory\shutdown.txt"
#Shuts the computer down forcefully but gracefully
Stop-Computer -Force
}

#Reboot
if ($reboot -eq $True) {
#Removes the reboot file to prevent an imediate reboot when the computer starts back up
Remove-Item -Path "$SearchDirectory\reboot.txt"
#Reboots the computer forcefully but gracefully
Restart-Computer -Force
}

#Hibernate
if ($hibernate -eq $True) {
#Removes the hibernate file to prevent an imediate hibernate when the computer starts back up
Remove-Item -Path "$SearchDirectory\hibernate.txt"
#Hibernates the computer forcefully but gracefully
.\VoiceControl.sp1
Start-Sleep -Seconds 3
.\psshutdown.exe -d -t 0 -v 0
#shutdown.exe /h
}

#Volume Up
if ($louder -eq $True) {
#Removes the Volume file to prevent changing volume on startup
Remove-Item -Path "$SearchDirectory\louder.txt"
#Starting volume up
C:\Scripts\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
C:\Scripts\nircmd\nircmd changesysvolume 6500
.\VoiceControl.sp1
}

#Volume Down
if ($quieter -eq $True) {
#Removes the Volume file to prevent changing volume on startup
Remove-Item -Path "$SearchDirectory\quieter.txt"
#Starting volume down
C:\Scripts\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
C:\Scripts\nircmd\nircmd changesysvolume -6500
.\VoiceControl.sp1
}

#Pause
if ($pause -eq $True) {
#Removes the Pause file to preventing space on startup
Remove-Item -Path "$SearchDirectory\pause.txt"
#Pausing
start C:\Scripts\pause.vbs
.\VoiceControl.ps1
}

#Soundcloud
if ($soundcloud -eq $True) {
#Removes the soundcloud file to prevent starting sc on startup
Remove-Item -Path "$SearchDirectory\soundcloud.txt"
#Starts the sc start script
C:\Scripts\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
start https://soundcloud.com
timeout /T 3
start C:\Scripts\Browser\soundcloud.vbs
.\VoiceControl.sp1
}

#Soundcloud Next Track
if ($soundcloud -eq $True) {
#Removes the soundcloud file to prevent starting sc on startup
Remove-Item -Path "$SearchDirectory\soundcloud-next.txt"
#Starts the sc start script
start C:\Scripts\browser\soundcloud-next.vbs
.\VoiceControl.sp1
}
