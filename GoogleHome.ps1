#CREDITS Go to: Hylke Jellema (https://www.youtube.com/watch?v=gOt1IyEAIxA&feature=youtu.be)
#Script optimized by FaserF (https://github.com/FaserF)
# -------------------------------------------------------------------------------------------
#IMPORTANT: If the script wont work insert the following line in powershell (Administrator): 
#set-executionpolicy -executionpolicy unrestricted
# -------------------------------------------------------------------------------------------
#Declaring Variables
$SearchDirectory = "C:\Users\fabia\Dropbox\IFTTT"
$SleepTime = 5

#Sleep for 1 minute before being active (to prevent boot loops if the file for some reason is not deleted)
Start-Sleep -Seconds 60

#Loop checking to see if the file has been created and once it has it continues on. Sleep in the look to prevent CPU pegging
Do {
Start-Sleep -Seconds $SleepTime
$shutdown = Test-Path -Path "$SearchDirectory\shutdown.txt"
$reboot = Test-Path -Path "$SearchDirectory\reboot.txt"
$hibernate = Test-Path -Path "$SearchDirectory\hibernate.txt"
$soundcloud = Test-Path -Path "$SearchDirectory\soundcloud.txt"
}
Until ($shutdown -eq $True -or $reboot -eq $True -or $hibernate -eq $True)

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
start C:\Scripts\hibernate.cmd
}

#Volume Up
if ($louder -eq $True) {
#Removes the Volume file to prevent changing volume on startup
Remove-Item -Path "$SearchDirectory\louder.txt"
#Starting volume up
start C:\Scripts\volume\louder.cmd
}

#Volume Up
if ($quieter -eq $True) {
#Removes the Volume file to prevent changing volume on startup
Remove-Item -Path "$SearchDirectory\quieter.txt"
#Starting volume down
start C:\Scripts\volume\quieter.cmd
}

#Soundcloud
if ($soundcloud -eq $True) {
#Removes the soundcloud file to prevent starting sc on startup
Remove-Item -Path "$SearchDirectory\soundcloud.txt"
#Starts the sc start script
start C:\Scripts\browser\soundcloud.cmd
}

#Soundcloud Next Track
if ($soundcloud -eq $True) {
#Removes the soundcloud file to prevent starting sc on startup
Remove-Item -Path "$SearchDirectory\soundcloud-next.txt"
#Starts the sc start script
start C:\Scripts\browser\soundcloud-next.vbs
}