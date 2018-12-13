
# 3d view
azim=45
elevation=25
angle_view=$azim/$elevation


figname=test_pie
fmt=pdf
gmt begin $figname $fmt,png
    gmt gmtset COLOR_BACKGROUND=black@100
    gmt basemap -JP9c/0 -R0/360/0/10 -BSEN+ggray@100 --MAP_FRAME_PEN=2p,black
    echo "0 0 9 0 45" | gmt psxy -Sw -Ggreen
    gmt basemap -JP4c/0 -R0/360/0/10 -BSEN+ggray --MAP_FRAME_PEN=2p,black -X2.5c -Y2.5c
    echo "0 0 9 45 80" | gmt psxy -Sw -Ggreen
    # gmt basemap -JP9c/0 -R90/120/0/4 -BSNE+gred --MAP_FRAME_PEN=2p,black 
    # gmt basemap -JP9c/180 -R0/90/0/4 -BSNE+gred --MAP_FRAME_PEN=2p,black -X-9c -Y-9c
gmt end

open $figname.$fmt