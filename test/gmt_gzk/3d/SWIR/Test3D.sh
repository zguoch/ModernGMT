# Test 3D View of GMT: simple example
# Zhikui Guo, 2018-12-09, GEOMAR, Germany

# 0. include some code segments
. include.sh
# 0.1 figset
figset
# 0.2 data set
dataset
# 1. apply theme
MonokaiTheme


# plot 
gmt begin $figname pdf
    gmt basemap -JX$width_fig_x/$width_fig_y -JZ$width_fig_z -R$xmin/$xmax/$ymin/$ymax/$zmin/$zmax -Ba -Bza+l"Z(m)" -BwsenZ+gred  -pz$angle_view/$zmin
    echo "$xc $yc zmin plane" | gmt pstext -JZ -p -F+f20p,Helvetica-Bold,blue=thinner,white+jCM+a190 -Dj0c/0c
    gmt basemap -JX$width_fig_x/$width_fig_y -JZ$width_fig_z -R$xmin/$xmax/$ymin/$ymax/$zmin/$zmax -Bwsenz+ggray  -pz$angle_view/$zmax
    echo "$xc $yc zmax plane" | gmt pstext -JZ -p -F+f20p,Helvetica-Bold,blue=thinner,white+jCM+a190 -Dj0c/0c
    gmt basemap -JX$width_fig_y/$width_fig_z -JZ$width_fig_x -R$ymin/$ymax/$zmin/$zmax/$xmin/$xmax -Ba -BwSenz+glightblue@$alpha_profile -Bx+l"Y(m)" --MAP_FRAME_PEN=1,black@0 --MAP_ANNOT_OFFSET=-0.2   -px$angle_view/$xminn
    echo "$yc $zc ymin plane" | gmt pstext -JZ -p -F+f20p,Helvetica-Bold,blue=thinner,white+jCM+a45 -Dj0c/0c
    gmt basemap -JX$width_fig_x/$width_fig_z -JZ$width_fig_y -R$xmin/$xmax/$zmin/$zmax/$ymin/$ymax -Ba -BwSenz+glightgreen@$alpha_profile -Bx+l"X(m)" --MAP_FRAME_PEN=1,black@0 --MAP_ANNOT_OFFSET=-0.2  -py$angle_view/$ymax
    echo "$xc $zc xminn plane" | gmt pstext -JZ -p -F+f20p,Helvetica-Bold,blue=thinner,white+jCM+a-45 -Dj0c/0c
gmt end


open $figname.pdf

rm tmp* gmt.conf gmt.history 