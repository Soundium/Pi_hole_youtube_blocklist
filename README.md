               
## Tool for preparation a blacklist for Pi-Hole to block Youtube advertising. 
          
The tool collects all googlevideo.com domains and adds them to Pi-hole setup. Add these domains to your Pi-Hole setup by running a script and make your setup **trouble-free!**
                
Want to report any issue? Feel free to file an <a href="https://github.com/Soundium/Pi_hole_youtube_blocklist/issues">issue</a>.
           
### Installation and Usage

1. Register on <a href="https://www.wolframalpha.com/">Wolframalpha</a> and get your APPID. 
2. Download scripts.
```
cd /opt/
git clone https://github.com/Soundium/Pi_hole_youtube_blocklist.git
cd Pi_hole_youtube_blocklist/scripts
```
3. Add your APPID to temp.sh. 
```
sudo nano /opt/Pi_hole_youtube_blocklist/scripts/temp.sh
```
CTRL + X then Y and Enter

4. Give the rights.
```
sudo chmod +x /etc/pihole/temp.sh
```
5. Add scripts to crontab to run at 1 AM and 5 AM on the last day of the week.

`sudo nano /etc/crontab`

Add those lines at the end of the file:       
`0 1 * * */7     root    /opt/Pi_hole_youtube_blocklist/scripts/temp.sh`

`0 5 * * */7     root    /opt/Pi_hole_youtube_blocklist/scripts/youtube-ads.sh`

CTRL + X then Y and Enter

6. First run
```
sudo Pi_hole_youtube_blocklist/scripts/temp.sh
sudo Pi_hole_youtube_blocklist/scripts/youtube-ads.sh
```
7. Add http://localhost/youtube.txt as blacklist from local to Pi-hole setup.
   
***     
   
### License
```
MIT License

Copyright (c) 2020 Soundium

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

