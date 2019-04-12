#!/bin/bash
#
# Testing gmt legend capabilities for tables with colors

gmt begin GMT_inset ps
    # Bottom map of Australia
    gmt coast -R110E/170E/44S/9S -JL140E/26.5S/20S/33S/6i -Baf -BWSne -Wfaint -N2/1p  -EAU+gbisque -Gbrown -Sazure1 -Da -X2c --FORMAT_GEO_MAP=dddF
    gmt basemap -DjTR+w1i+o0.25i/0+stmp -F+gwhite+p1p+c0.1c+s
    read x0 y0 w h < tmp
    gmt coast -Rg -JG120/30S/$w -Da -Gbrown -A5000 -Bg -Wfaint -EAU+gbisque -X$x0 -Y$y0 
    gmt plot -T  -X-${x0} -Y-${y0} 
gmt end