#!/bin/bash
soundsdir='/home/mansionclock/modern/audio'

# Get the current hour in 24-hour format (00-23) to determine the music type
hour_24=$(date +%-H)

# Get the current hour in 12-hour format (1-12) to determine the chime count
# Noon chimes 13 times.  ;)
chime_count=$(date +%-I)
[ "$chime_count" -eq 12 ] && chime_count=13

# 1. Determine and play the correct intro music based on the hour
case $hour_24 in
    8|12|20)
        # Play Foyer music at 8 AM, 12 PM, and 8 PM
        mpv "$soundsdir/foyer.mp3"
        ;;
    9|10|11|13|14|15|16|17|18|19)
        # Play Musicbox music from 9-11 AM and 1-7 PM
        mpv "$soundsdir/musicbox.mp3"
        ;;
esac

# 2. Seamlessly loop the single chime file matching the 12-hour count
mpv --ao=alsa --loop-file=$((chime_count - 1)) "$soundsdir/chime.mp3"
