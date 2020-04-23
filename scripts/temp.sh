#!/bin/sh
# This script will fetch the Googlevideo ad domains and append them to the Pi-hole block list.
# Run this script daily with a cron job.
# Project homepage: https://github.com/Soundium/Pi_hole_youtube_blocklist/
# Licence: https://github.com/Soundium/Pi_hole_youtube_blocklist/blob/master/LICENSE
# Created by Soundium

# File to store the YT ad domains
FILE=/etc/temp/temp.txt

# Wolfram Alfa APPID
APPID="Register on https://www.wolframalpha.com/ and put your APPID here"
POD_TIMEOUT="20"

# Fetch the list of domains, remove the ip's and save them
curl 'https://api.hackertarget.com/hostsearch/?q=googlevideo.com' \
| awk -F, 'NR>1{print $1}' \
| grep -vE "redirector|manifest" > $FILE

# Replace r*.sn*.googlevideo.com URLs to r*---sn-*.googlevideo.com
# and add those to the list too
curl "http://api.wolframalpha.com/v2/query?input=googlevideo.com&appid=${APPID}&format=plaintext&podtimeout=${POD_TIMEOUT}&podstate=WebSiteStatisticsPod:InternetData__Subdomains&podstate=WebSiteStatisticsPod:InternetData__Subdomains_More” \

| grep -Po "r\d+---sn-.+.googlevideo.com" >> $FILE

# Scan log file for previously accessed domains
grep r*.googlevideo.com /var/log/pihole.log \
| awk '{print $6}' \
| grep -v '^googlevideo.com\|redirector\|manifest' \
| sort | uniq >> $FILE

# Replace r*.sn*.googlevideo.com URLs to r*---sn-*.googlevideo.com
# and add those to the list too
cat $FILE | sed -i $FILE -re 's/(^r[[:digit:]]+)(\.)(sn)/\1---\3-/' >> $FILE

#delete duplicates
perl -i -ne 'print if ! $x{$_}++' /etc/temp/temp.txt

#demonstrative
cat $FILE >>  /var/www/html/temp.txt

