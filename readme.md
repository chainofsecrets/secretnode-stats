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
Firstly, you will need to install powershell on the machine which you choose to monitor your **SecretNode** from. (Best to be on a laptop or a seperate small $5 per month VPS)

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
      # git clone https://github.com/chainofsecrets/secretnode-stats
      
## Configuring SecretNode-Stats

TBD 
   
