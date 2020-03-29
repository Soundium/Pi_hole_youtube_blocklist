#!/bin/sh
# This script will fetch the Googlevideo ad domains and append them to the Pi-hole block list.
# Run this script daily with a cron job.
# Project homepage: https://github.com/anudeepND/whitelist
# Licence: https://github.com/Soundium/Pi_hole_youtube_blocklist/blob/master/LICENSE
# Created by Soundium

echo off

#copy file to blacklist
cat /etc/temp/temp.txt >> /var/www/html/youtube.txt

#delete duplicates
perl -i -ne 'print if ! $x{$_}++' /var/www/html/youtube.txt

#removes the temporary file on the raspberry pi
rm /var/www/html/temp.txt

#updates pihole blacklist/whitelist
pihole -g
