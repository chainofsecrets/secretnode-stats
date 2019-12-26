<h1 align="center">
  SecretNode-Stats
</h1>
SecretNode-Stats is a monitoring script built in Powershell to check and monitor that your SecretNode is logged in and active ready to produce blocks in an epoch. 
The script will send an email alert to you if your node has logged out (which will cause it to miss an epoch task) 

This will be most useful for Enigma Genesis Game Candidates, although anyone running a SecretNode can use it.

<br/>

# How to use
You are not obligated to run the SecretNode-Stats script on the same system that runs your witness node.
Firstly, you will need to install powershell on the machine which you choose to monitor your **secretnode** from.

   ## Installing Powershell on Ubuntu 16.04
      # Import the public repository GPG keys
        curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

      # Register the Microsoft Ubuntu repository
        curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list

      # Update apt-get
        sudo apt-get update

      # Install PowerShell
        sudo apt-get install -y powershell

      # Start PowerShell
        powershell
   
   ## Installing Powershell on Mac OSX
      
      # Install PowerShell
        brew cask install powershell
      
      # Start PowerShell
        pwsh
      
   
  
## Copying the SecretNode-Stats code using git
      # git clone https://github.com/chainofsecrets/secretnode-stats
      
## Configuring SecretNode-Stats
   
