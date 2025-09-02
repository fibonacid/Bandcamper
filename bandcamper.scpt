-- Ask for URL
set userURL to text returned of (display dialog "Enter the URL:" default answer "https://clam-pressure.bandcamp.com/album/graceful-degradation")

-- Run the shell command
do shell script "
  mkdir -p ~/Downloads/Bandcamper
	cd ~/Downloads/Bandcamper
	/usr/local/bin/bandcamper url " & quoted form of userURL

-- Open the folder
do shell script "open ~/Downloads/Bandcamper"



