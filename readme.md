<h1 align="center">
  SecretNode-Stats
</h1>
<h5 align="center">
  Built by ChainofSecrets.org
</h1>
SecretNode-Stats is a monitoring script built in Powershell to check and monitor that your SecretNode is logged in and active ready to produce blocks in an epoch. 
The script will send an email alert to you if your node has logged out (which will cause it to miss an epoch task) 

This will be most useful for Enigma Genesis Game Candidates, although anyone running a SecretNode can use it.

<br/>

# How to use
You are not obligated to run the **SecretNode-Stats** script on the same machine that runs your Enigma Secret Node.
Firstly, you will need to install powershell on the machine which you choose to monitor your **SecretNode** from. (Best to be on a laptop/desktop or a seperate small $5 per month VPS)

   ## Installing Powershell on Ubuntu 18.04
      # Download the Microsoft repository GPG keys
        wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb

      # Register the Microsoft repository GPG keys
        sudo dpkg -i packages-microsoft-prod.deb

      # Update the list of products
        sudo apt-get update

      # Enable the "universe" repositories
        sudo add-apt-repository universe

      # Install PowerShell
        sudo apt-get install -y powershell

      # Start PowerShell
        pwsh
   
   ## Installing Powershell on Mac OSX
      
      # Install PowerShell
        brew cask install powershell
      
      # Start PowerShell
        pwsh
      
   
  
## Copying the SecretNode-Stats code using git
      # Clone ChainofSecrets Secretnode-Stats Repo
      git clone https://github.com/chainofsecrets/secretnode-stats.git
      
## Configuring SecretNode-Stats
     
      # Change into Secretnode-Stats Directory
        cd Secretnode-Stats/
        vi secretnode-stat.ps1
        
   **`EDIT THE FOLLOWING CONFIG LINES IN THE SCRIPT TO YOUR NEEDS. MAKE SURE TO CHANGE TO YOUR ENIGMA OPERATING NODE ADDRESS`**

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

   ## Running SecretNode-Stats
      # Change into SecretNode-Stats Directory
        cd Secretnode-Stats/
        
      # Change Permissions to enable running
        sudo chmod +x secretnode-stat.ps1
        
      # Start Powershell
        pwsh
        
      # Execute SecretNode-Stats
        ./secretnode-stat.ps1
