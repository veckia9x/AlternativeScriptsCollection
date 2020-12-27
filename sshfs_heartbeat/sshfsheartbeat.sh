#!/bin/bash
# SSHFS HEARTBEAT SCRIPT
# SCRIPT BY ALPHA#9751 (DISCORD)

# VARIABLES
heartip1=
heartport1=
sshfsuser=
sshfslocal=
sshfsremote=
sshfspassword=
webhook=
okjson=$(cat <<EOF
{
"username":"SSHFS Heartbeat",
"avatar_url":"",
"file":"content",
"embeds": [{
        "color": "2067276",
        "type": "content",
        "fields": [
                        {
                                "name": "Status",
                                "value": "SSHFS link alive."
                        }
                  ]
          }]
}
EOF
)
deadjson=$(cat <<EOF
{
"username":"SSHFS Heartbeat",
"avatar_url":"",
"file":"content",
"embeds": [{
        "color": "2067276",
        "type": "content",
        "fields": [
                        {
                                "name": "Status",
                                "value": "SSHFS link dead."
                        }
                  ]
          }]
}
EOF
)
rcjson=$(cat <<EOF
{
"username":"SSHFS Heartbeat",
"avatar_url":"",
"file":"content",
"embeds": [{
        "color": "2067276",
        "type": "content",
        "fields": [
                        {
                                "name": "Status",
                                "value": "Trying to reconnect SSHFS link."
                        }
                  ]
          }]
}
EOF
)

# Check mount point (1= alive; 0= dead)
statusmp=$(mount | grep -c $heartip1)

if [ $statusmp == '0' ]
	then 
		# Send msg: Trying to reconnect.
		curl -sSL -H "Content-Type: application/json" -X POST -d """${rcjson}""" $webhook
		# Check heartbeat (0= alive; 1= dead)
		nc -zw 1 $heartip1 $heartport1 > /dev/null
		heartstatus=$(echo $?)
		if [ $heartstatus == '0' ]
			then 
				echo $sshfspassword | sshfs -p $heartport1 -o password_stdin -o allow_other $sshfsuser@$heartip1:$sshfsremote $sshfslocal
			else 
				curl -sSL -H "Content-Type: application/json" -X POST -d """${deadjson}""" $webhook
		fi
	else 
		# Send webhook msg: Remote link ok.
		curl -sSL -H "Content-Type: application/json" -X POST -d """${okjson}""" $webhook
fi

# SCRIPT BY ALPHA#9751 (DISCORD)
