. stdafx.sh
echo $me

fmt=pdf
rm logo.$fmt
gmt begin logo $fmt

    gmt basemap -Jx1/1 -R0/10/0/5 -Bafg
    # gmt psimage planets.eps -D0c/0c+w5c --PS_MEDIA=A1
    gmt image logo/moderngmt.png -Dg2/1+w3c
    # echo "2.4 0.8"|gmt psxy -Sc2c -Gwhite@50 -W1p,red
    date +%Y-%m-%d | awk '{print 2, 1, $1}' |gmt pstext -F+f20p,Helvetica-Bold,red=thinner,white+jLB+a0
gmt end

open logo.$fmt

