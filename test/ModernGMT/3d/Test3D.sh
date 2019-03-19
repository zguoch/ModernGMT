# Test 3D View of GMT: simple example
# Zhikui Guo, 2018-12-09, GEOMAR, Germany

function preset()
{
    figname=Test_3d
    angle_view=-45/25
    width_fig_x=10
    width_fig_y=10
    width_fig_z=7
    # 透明度
    alpha_profile=50
    # range
    xmin=0
    xmax=100
    ymin=0
    ymax=50
    zmin=-20
    zmax=0
    xc=`echo $xmin $xmax | awk '{print $1+($2-$1)/2}'`
    yc=`echo $ymin $ymax | awk '{print $1+($2-$1)/2}'`
    zc=`echo $zmin $zmax | awk '{print $1+($2-$1)/2}'`
    len_z=`echo $zmin $zmax | awk '{print ($2-$1)}'`
}
# 1. apply theme
. styles.sh
# MonokaiTheme
# 常用代码头文件:绘制logo
. stdafx.sh
# 范围和颜色等设置
preset

# plot 
gmt begin $figname pdf,png
    gmt basemap -JX$width_fig_x/$width_fig_y -JZ$width_fig_z -R$xmin/$xmax/$ymin/$ymax/$zmin/$zmax -Ba -Bza+l"Z(m)" -BwsenZ+gred  -pz$angle_view/$zmin
    echo "$xc $yc zmin plane" | gmt pstext -JZ -p -F+f20p,Helvetica-Bold,blue=thinner,white+jCM+a190 -Dj0c/0c
    gmt basemap -JX$width_fig_x/$width_fig_y -JZ$width_fig_z -R$xmin/$xmax/$ymin/$ymax/$zmin/$zmax -Bwsenz+ggray  -pz$angle_view/$zmax
    echo "$xc $yc zmax plane" | gmt pstext -JZ -p -F+f20p,Helvetica-Bold,blue=thinner,white+jCM+a190 -Dj0c/0c
    gmt basemap -JX$width_fig_y/$width_fig_z -JZ$width_fig_x -R$ymin/$ymax/$zmin/$zmax/$xmin/$xmax -Ba -BwSenz+glightblue@$alpha_profile -Bx+l"Y(m)" --MAP_FRAME_PEN=1,black@0 --MAP_ANNOT_OFFSET=-0.2   -px$angle_view/$xminn
    echo "$yc $zc ymin plane" | gmt pstext -JZ -p -F+f20p,Helvetica-Bold,blue=thinner,white+jCM+a45 -Dj0c/0c
    gmt basemap -JX$width_fig_x/$width_fig_z -JZ$width_fig_y -R$xmin/$xmax/$zmin/$zmax/$ymin/$ymax -Ba -BwSenz+glightgreen@$alpha_profile -Bx+l"X(m)" --MAP_FRAME_PEN=1,black@0 --MAP_ANNOT_OFFSET=-0.2  -py$angle_view/$ymax
    echo "$xc $zc xminn plane" | gmt pstext -JZ -p -F+f20p,Helvetica-Bold,blue=thinner,white+jCM+a-45 -Dj0c/0c
    # 使用logo
    add_logo 0 0.5 moderngmt -grid=false 
gmt end
open $figname.pdf
rm tmp* gmt.conf gmt.history 