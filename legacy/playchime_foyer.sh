#!/bin/bash
soundsdir='/home/mansionclock/sounds'
hour=`date +%I`.mp3
echo $hour
#omxplayer -o local $soundsdir/mansion_mid.mp3
#omxplayer -o local $soundsdir/music_box_fade.mp3
#omxplayer -o local $soundsdir/$hour
mpv $soundsdir/mansion_mid.mp3
mpv $soundsdir/$hour
