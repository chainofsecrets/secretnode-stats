# SecretNode-Stats v0.9
# ChainofSecrets.org
# All the lines starting with # Tag are a comment, please read them carefully to configure settings correctly.
# This program will run in an infinite loop, which means you need to stop this script if you don't want to let it run.

#Please Change the WorkerID to your own SecretNode Operating Address.
$WorkerID = "0xf935870592c5dd34930a291a24abbcfd145a34cb"

# Configure this Minute value, so that script can run on this interval, 5 value denotes that script will wait for 5 minute 
# to re-check, Change according to the requirement can be any decimal value 1,2,3,4,5 etc...
$CheckAfterEveryMin = 2

#Configure the from email id
$EmailFrom = "user@domain.net"

#Configure email id to whom you want to send email
$EmailTo = "user@domain.net"

#Configure the subject line
$EmailSubject = "[Alert] SecretNode has Logged Out"

#Configure SMTP server either name or IP address 
$SMTPServer = "smtphost.domain.net"

#Default SMTP port is 25 but incase SMTP is running on any other port, configure this $smtpport value
$SMTPPort = 25

#Configure the user name who is authorized to send an email
$SMTPAuthUsername = "username"

#Configure password of the user
$SMTPAuthPassword = "password"

#Configure the Settings to use SSL
$UseSSL = $true

#Configure the body text of the email
$emailbody = "[Alert] Your SecretNode has Logged Out"


$SMTPAuthPassword = $SMTPAuthPassword | Convertto-SecureString -AsPlainText -Force
$credentials = New-Object System.Management.Automation.Pscredential ($SMTPAuthUsername, $SMTPAuthPassword)


#Functions & Variables
$Global:Status = ""
$Global:ID = ""
$Global:EmailCounter = 2

function send_email {

if ($UseSSL)
{
#Send-MailMessage -To $EmailTo -From $EmailFrom  -SMTPServer $SMTPServer -UseSsl -Port $SMTPPort -Credential $credentials -Subject $EmailSubject -Body $emailbody
Write-Host "send email"
}
else
{
Send-MailMessage -To $EmailTo -From $EmailFrom  -SMTPServer $SMTPServer -Port $SMTPPort -Credential $credentials -Subject $EmailSubject -Body $emailbody
}

}

$SendCounter=1
function Get-Status
{

$url = "https://api.thegraph.com/subgraphs/name/enigmampc/enigma"
$json = '{"query":"{ worker(id: \"' + $WorkerID + '\"){status}}"}'

$Query = Invoke-RestMethod $url -Method Post -Body $json

$Global:Status = $Query.data.worker.status

$json = '{"query":"{ enigmaStates{latestEpoch{id}}}"}'
$Query = Invoke-RestMethod $url -Method Post -Body $json
$enigmaState = $Query.data.enigmaStates

$Global:ID = $enigmaState.latestepoch.id


}


while(1)
{

Get-Status

$waitforSeconds = 60 * $CheckAfterEveryMin

$Time = Get-Date -DisplayHint Time
if ($Global:Status -eq "LoggedOut")
{
Write-Host "========================================================================== " -BackgroundColor Blue -ForegroundColor White
Write-Host "Time $time SecretNode is $Global:Status & The Current Epoch is $Global:ID " -BackgroundColor Blue -ForegroundColor White
Write-Host "========================================================================== " -BackgroundColor Blue -ForegroundColor White
Write-Host "                       Built by ChainofSecrets.org                         " -BackgroundColor Blue -ForegroundColor White
Write-Host "                                                                           " -BackgroundColor Blue -ForegroundColor White
if($SendCounter -le $Global:EmailCounter)
{
#send_email
$SendCounter +=1
}
} 
else
{
Write-Host "========================================================================== " -BackgroundColor Blue -ForegroundColor White
Write-Host "Time $time SecretNode is $Global:Status & The Current Epoch is $Global:ID " -BackgroundColor Blue -ForegroundColor White
Write-Host "========================================================================== " -BackgroundColor Blue -ForegroundColor White
Write-Host "                       Built by ChainofSecrets.org                         " -BackgroundColor Blue -ForegroundColor White
Write-Host "                                                                           " -BackgroundColor Blue -ForegroundColor White
Write-Host ""
$SendCounter = 1

}

Start-Sleep -Seconds $waitforSeconds
}
