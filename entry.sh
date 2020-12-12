#!/bin/bash

if [[ -z "$SRCDS_TOKEN" ]]
then
  echo "No SRCDS_TOKEN given, exiting"
  exit 1
fi

/steam/csgo/srcds_run -game csgo -console -usercon +game_type 0 +game_mode 1 +mapgroup mg_allcalssic +map de_dust +sv_setsteamaccount $SRCDS_TOKEN -net_port_try 1
