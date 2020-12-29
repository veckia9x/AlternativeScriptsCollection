#!/bin/bash

# PING TIMEOUT SCREEN OFF SCRIPT
# SCRIPT BY ALPHA#9751 (DISCORD)

# Variables
# ---------------------------------

# Define IP for ping.
addrip=
# Time in seconds to turn screen off.
scrmin=

# SCRIPT
# ---------------------------------

if [ $(ping -c1 $addrip | grep -i -c1 -E "timeout|unreachable") == '1' ]
 then
  sleep $scrmin && xset dpms force off
 else
  echo UserOnline >/dev/null
fi

# SCRIPT BY ALPHA#9751 (DISCORD)
