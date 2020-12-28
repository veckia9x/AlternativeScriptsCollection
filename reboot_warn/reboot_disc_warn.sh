#xxxxxxxxxxxxxx reboot_discord_warn xxxxxxxxxxxxxxx

# Def. Discord webhook
dswebhook=

# Def. Message
json=$(cat <<EOF
{
"username":"",
"avatar_url":"",
"file":"content",
"embeds": [{
        "color": "2067276",
        "type": "content",
        "fields": [
                        {
                                "name": "O servidor reiniciou.",
                                "value": "Favor verificar seu(s) servidor(es)"
                        }
                  ]
          }]
}
EOF
)


# Send message cmd
curl -sSL -H "Content-Type: application/json" -X POST -d """${json}""" $dswebhook

#/etc/rc.local
#Wrote_by_Veckia_(Alpha#9751_at_discord)
#xxxxxxxxxxxxxx reboot_discord_warn xxxxxxxxxxxxxxx
