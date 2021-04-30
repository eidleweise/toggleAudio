#This uses https://github.com/frgnca/AudioDeviceCmdlets 

#test

#Get-AudioDevice -List | where Type -like "Recording" | where name -like "*Logitech*" | Set-AudioDevice -Verbose 
#Get-AudioDevice -List | where Type -like "Playback" | where name -like "*Logitech*" 
#Get-AudioDevice -List | where Type -like "Recording" | where name -like "*Yeti*" | Set-AudioDevice -Verbose 

#To get the list
$audioDevices = Get-AudioDevice -List
foreach ($audioDevice in $audioDevices) {
    Write-Output "Name: " $audioDevice.NAME " ID: " $audioDevice.ID
}