#Control PC by Voice - V1.1
#Will work with Alexa and Google Assistant
# -------------------------------------------------------------------------------------------
#CREDITS Go to: Hylke Jellema (https://www.youtube.com/watch?v=gOt1IyEAIxA&feature=youtu.be)
#Script optimized & new features by FaserF (https://github.com/FaserF/ControlPCWithVoice)
# -------------------------------------------------------------------------------------------
#IMPORTANT: If the script wont work insert the following line in powershell (Administrator): 
#set-executionpolicy -executionpolicy unrestricted
# -------------------------------------------------------------------------------------------

#Declaring Variables
$ScriptDirectory = "C:\Scripts"
$SearchDirectory = "C:\Users\fabia\Dropbox\IFTTT"
$SleepTime = 5

cd $ScriptDirectory

#Sleep for 30 Seconds before being active (to prevent boot loops if the file for some reason is not deleted)
Start-Sleep -Seconds 30

#Loop checking to see if the file has been created and once it has it continues on. Sleep in the look to prevent CPU pegging
Do {
Start-Sleep -Seconds $SleepTime
$shutdown = Test-Path -Path "$SearchDirectory\shutdown.txt"
$reboot = Test-Path -Path "$SearchDirectory\reboot.txt"
$hibernate = Test-Path -Path "$SearchDirectory\hibernate.txt"
$pause = Test-Path -Path "$SearchDirectory\pause.txt"
$louder = Test-Path -Path "$SearchDirectory\louder.txt"
$quieter = Test-Path -Path "$SearchDirectory\quieter.txt"
$netflix = Test-Path -Path "$SearchDirectory\netflix.txt"
$soundcloud = Test-Path -Path "$SearchDirectory\soundcloud.txt"
}
Until ($shutdown -eq $True -or $reboot -eq $True -or $hibernate -eq $True -or $louder -eq $True -or $quieter -eq $True -or $soundcloud -eq $True -or $pause -eq $True -or $netflix -eq $True)
#-or $soundcloud-next -eq $True)

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
shutdown.exe /h
.\VoiceControl.ps1
}

#Volume Up
if ($louder -eq $True) {
#Removes the Volume file to prevent changing volume on startup
Remove-Item -Path "$SearchDirectory\louder.txt"
#Starting volume up
cmd $ScriptDirectory\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
cmd $ScriptDirectory\nircmd\nircmd changesysvolume 6500
.\VoiceControl.ps1
}

#Volume Down
if ($quieter -eq $True) {
#Removes the Volume file to prevent changing volume on startup
Remove-Item -Path "$SearchDirectory\quieter.txt"
#Starting volume down
cmd $ScriptDirectory\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
cmd $ScriptDirectory\nircmd\nircmd changesysvolume -6500
.\VoiceControl.ps1
}

#Pause
if ($pause -eq $True) {
#Removes the Pause file to preventing space on startup
Remove-Item -Path "$SearchDirectory\pause.txt"
#Pausing
cmd /C cscript $ScriptDirectory\pause.vbs
.\VoiceControl.ps1
}

#Netflix
if ($netflix -eq $True) {
#Removes the netflix file to prevent starting sc on startup
Remove-Item -Path "$SearchDirectory\netflix.txt"
#Starts the sc start script
cmd $ScriptDirectory\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
start https://www.netflix.com/browse
timeout /T 3
cmd /C cscript $ScriptDirectory\browser\netflix.vbs
.\VoiceControl.ps1
}

#Soundcloud
if ($soundcloud -eq $True) {
#Removes the soundcloud file to prevent starting sc on startup
Remove-Item -Path "$SearchDirectory\soundcloud.txt"
#Starts the sc start script
cmd $ScriptDirectory\nircmd\nircmd setdefaultsounddevice "Lautsprecher" 1
start https://soundcloud.com
timeout /T 3
cmd /C cscript $ScriptDirectory\browser\soundcloud.vbs
.\VoiceControl.ps1
}

#Soundcloud Next Track
if ($soundcloud-next -eq $True) {
#Removes the soundcloud file to prevent starting sc on startup
Remove-Item -Path "$SearchDirectory\soundcloud-next.txt"
#Starts the sc start script
start $ScriptDirectory\browser\soundcloud-next.vbs
.\VoiceControl.ps1
}
