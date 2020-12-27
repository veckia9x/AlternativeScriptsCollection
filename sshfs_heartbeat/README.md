## SSHFS Heartbeat  
#### Please check file inside, there are a few variables to define.  

Mainly this script check if your sshfs link is alive.  
If alive:  
- Send a discord message over webhook  

If not alive it will:  
- Send a discord message over webhook  
- Try to reconnect  
  If successful it will send a discord message over webhook with sshfs status.  
  If unsuccessful it will send a discord message over webhook with sshfs status.  
  
#### VARIABLES  
```
heartip1=  
heartport1=  
sshfsuser=  
sshfslocal=  
sshfsremote=  
sshfspassword=  
webhook=  
```
###### You can also change the json variables to modify username, user picture, message, etc...
