# CrowdStrike

# Force uninstall on macOS
Sometimes there is a need to uninstall CrowdStrike without maintenance token and/or access to the console. 
This howto will help you achieving this on MacOS 11-13. 

1. Open Terminal app and run ```systemextensionsctl list```. Make sure that you see CrowdStrike there (otherwise CrowdStrike is not active on your system and you can just remove it as a regular app)
2. Now we need to disable the SIP https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection. This removes one of the most effective security control on your system -> don't skip the last step
- Power down your mac and hold the TouchID button during the fresh boot to enter the Recovery Mode (works only on Apple silicone. For Intel CPU check the link above)
- When Recovery screen is here, go to "Options"
- Pick your user and enter your password
- At the top menu bar find the Terminal app
- In the Terminal type ```csrutil disable``` & reboot to normal OS
3. Now open the Terminal again and type ```systemextensionsctl list```. Note the ```teamID``` and package name (aka, ```bundleId```). Run ```systemextensionsctl uninstall <teamId> <bundleId>``` to remove the system extention. 
4. Boot to recovery mode again and reenable SIP using ```csrutil enable``` Terminal command
5. Boot normaly and run 
```bash
sudo rm -rf /Applications/Falcon.app
sudo rm /Library/LaunchAgents/com.crowdstrike.falcon.UserAgent.plist
``` 
(you may need to grant Terminal app permissions to remove apps) to clear all files remaining
