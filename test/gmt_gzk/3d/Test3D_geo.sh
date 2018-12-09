# Test 3D View of GMT: geographic project example
# Zhikui Guo, 2018-12-09, GEOMAR, Germany

# 0. include some code segments
. include.sh
plot_gmtset
# 0.1 figset
figset
# 0.2 data set
dataset
# 1. apply theme
# MonokaiTheme

# 2. 计算一些信息
preCompute

# plot 
figname=${figname}_geo
fmt=png
# gmt begin $figname $fmt
#     # gmt basemap -JM$width_fig_x -JZ$width_fig_z -R$range_LonLatZ -Ba -Bza+l"Depth (m)" -BWSENZ  -pz$angle_view/$zmin
#     # echo $range_LonLatZ
#     # gmt psbasemap -JM${width_fig_x}c  -R$lon_min/$lon_max/$lat_min/$lat_max -Ba -Bwsen  -TdjTR+o3c/-4c+w2c+f+lW,,S, --FONT_TITLE=12p --MAP_TITLE_OFFSET=0.1c --PS_MEDIA=A4

#     gmt psbasemap -JM$width_fig_x -JZ${width_fig_z}  -R$range_LonLatZ -Ba -BwsenZ -Bza+l"Depth (m)" -pz$angle_view  -TdjTR+o3c/-4c+w2c+f+lW,,S, --FONT_TITLE=12p --MAP_TITLE_OFFSET=0.1c --PS_MEDIA=A4
#     gmt grdgradient ${bathy} -Az$angle_view -Gtmp.azm=nb/a -Ne0.2
#     gmt grdview ${bathy} -JZ -p -C$bathycpt -N${zmin}+g$color_profile -Qi -Itmp.azm 
#     gmt makecpt -C128 -T-5,0 -N > tmp.cpt
#     gmt grdview ${bathy} -JZ -p -Ctmp.cpt -Qi -Itmp.azm -t$alpha_bathy 
#     # add line
#     echo $lonc $lat_min >tmp_line
#     echo $lonc $lat_max >>tmp_line
#     awk 'NR>0 {print $1, $2}' tmp_line |gmt sample1d -I0.1k -AR | gmt grdtrack -G${bathy} | gmt psxyz  -JZ -p -W1,orange 
    
#     # text on seafloor
#     echo $lonc $latc "Bathymetry along profile"  | gmt pstext -JZ -p -Z0 -F+f20p,Helvetica-Bold,cyan=thinner,white+jMC+a-90
    
#     # profile

# gmt end
# gmt psconvert $figname.ps -Tg -A
# open $figname.$fmt

# gmt psbasemap -JM$width_fig_x  -R$range_lonlat -Ba -BWsenZ  -TdjTR+o3c/-4c+w2c+f+lW,,S, --FONT_TITLE=12p --MAP_TITLE_OFFSET=0.1c --PS_MEDIA=A4 >$figname.ps
# gmt psconvert $figname.ps -Tf -Au

rm $figname.ps
gmt psbasemap -JM$width_fig_x -JZ${width_fig_z}  -R$range_LonLatZ -Ba -BwsenZ -Bza+l"Depth (m)" -pz$angle_view  -TdjTR+o3c/-4c+w2c+f+lW,,S, --FONT_TITLE=12p --MAP_TITLE_OFFSET=0.1c --PS_MEDIA=A4 >$figname.ps
gmt psconvert $figname.ps -Tf -A -V
open $figname.pdf

rm gmt.conf gmt.history
