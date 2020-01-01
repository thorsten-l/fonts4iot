#!/bin/bash

# Ugly little Bash script, generates a set of .h files for GFX using
# GNU FreeFont sources.  There are three fonts: 'Mono' (Courier-like),
# 'Sans' (Helvetica-like) and 'Serif' (Times-like); four styles: regular,
# bold, oblique or italic, and bold+oblique or bold+italic; and four
# sizes: 9, 12, 18 and 24 point.  No real error checking or anything,
# this just powers through all the combinations, calling the fontconvert
# utility and redirecting the output to a .h file for each combo.

# Adafruit_GFX repository does not include the source outline fonts
# (huge zipfile, different license) but they're easily acquired:
# http://savannah.gnu.org/projects/freefont/

convert=./fontconvert
inpath=../fonts/
outpath=../src/
fonts=(WeatherIcons-Clouds WeatherIcons-CloudsNightDay WeatherIcons-SunMoonWind)
sizes=(5 6 7 8 9 10 12 14 16 18 20 22 24 26 28 30 32 36 40 )

for f in ${fonts[*]}
do
	for si in ${sizes[*]}
	do
		infile=$inpath$f".ttf"
		if [ -f $infile ] # Does source combination exist?
		then
			outfile=$outpath$f$si"pt7b.h"
			$convert $infile $si > $outfile
		fi
	done
done
