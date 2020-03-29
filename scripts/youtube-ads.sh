echo off

#copy file to blacklist
cat /etc/temp/temp.txt >> /var/www/html/youtube.txt

#delete duplicates
perl -i -ne 'print if ! $x{$_}++' /var/www/html/youtube.txt

#removes the temporary file on the raspberry pi
rm /var/www/html/temp.txt

#updates pihole blacklist/whitelist
pihole -g
