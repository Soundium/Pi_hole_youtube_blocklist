               
## Tool for preparation a blacklist for Pi-Hole to block Youtube advertising. 
          
Tool collect all googlevideo.com domains and add it to Pi-hole steup. Add these domains to your Pi-Hole setup by running a script or manually and make your setup **trouble-free!**
                
Want to report any issue? Feel free to file an <a href="https://github.com/Soundium/Pi_hole_youtube_blocklist/issues">issue</a>.
           
### Installation and Usage
            
```
git clone https://github.com/Soundium/Pi_hole_youtube_blocklist.git
cd Pi_hole_youtube_blocklist/scripts
sudo ./whitelist.sh
```
**Note: You don't have to clone the repo every time you need to update whitelist file. Navigate to `Pi_hole_Whitelist/scripts` and run it again `sudo ./whitelist.sh`**
        
***For optional-list.txt***     
You can add it manually depending upon the service you use. 

***For Automated Update***
```
cd /opt/
sudo git clone https://github.com/Soundium/Pi_hole_youtube_blocklist.git
```
Add scripts to crontab to run at 1 AM and 5 AM on the last day of the week.

`sudo nano /etc/crontab`

Add those lines at the end of the file:       
`0 1 * * */7     root    /opt/Pi_hole_youtube_blocklist/scripts/temp.sh`

`0 5 * * */7     root    /opt/Pi_hole_youtube_blocklist/scripts/youtube-ads.sh`

CTRL + X then Y and Enter

```
sudo Pi_hole_youtube_blocklist/scripts/temp.sh
sudo Pi_hole_youtube_blocklist/scripts/youtube-ads.sh
```
   
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

