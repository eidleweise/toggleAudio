#This uses https://github.com/frgnca/AudioDeviceCmdlets 

$AudioDevice_Speakers_NAME = "Speakers (High Definition Audio Device)"
$AudioDevice_Speakers_ID = "{0.0.0.00000000}.{f837b022-80be-4cd0-960a-61337466808c}" #Name    : "Speakers (High Definition Audio Device)"
$AudioDevice_Headset_NAME = "Speakers (3- Logitech G935/G933s Gaming Headset)"
$AudioDevice_Headset_ID = "{0.0.0.00000000}.{b11842f0-84ec-4c34-9d98-0266df87adee}" #Name    : Speakers (Logitech G935/G933s Gaming Headset) 

#Get-AudioDevice -List | where Type -like "Recording" | where name -like "*Logitech*" | Set-AudioDevice -Verbose 
#Get-AudioDevice -List | where Type -like "Playback" | where name -like "*Logitech*" 
#Get-AudioDevice -List | where Type -like "Recording" | where name -like "*Yeti*" | Set-AudioDevice -Verbose 

#To get the list
$audioDevices = Get-AudioDevice -List
foreach ($audioDevice in $audioDevices) {
    IF ($audioDevice.NAME -eq $AudioDevice_Speakers_NAME) {
        $AudioDevice_Speakers_ID = $audioDevice.ID
        Write-Output "Name: " $audioDevice.NAME " ID: " $audioDevice.ID
    }
    elseif ($audioDevice.NAME -eq $AudioDevice_Headset_NAME) {
        $AudioDevice_Headset_ID = $audioDevice.ID
        Write-Output "Name: " $audioDevice.NAME " ID: " $audioDevice.ID
    } else {
        #Write-Output "Name: " $audioDevice.NAME
    }
}


$DefaultPlayback = Get-AudioDevice -Playback
If ($DefaultPlayback.ID -eq $AudioDevice_Speakers_ID) {
    Set-AudioDevice -ID $AudioDevice_Headset_ID
}
Else {
    Set-AudioDevice -ID $AudioDevice_Speakers_ID
}

# Play sound
$Sound = new-Object System.Media.SoundPlayer
$Sound.SoundLocation = "c:\WINDOWS\Media\Windows Background.wav"
$Sound.Play()

Start-Sleep -s 3 #give it a  chance to play!