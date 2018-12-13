# Test 3D View of GMT: geographic project example
# Zhikui Guo, 2018-12-09, GEOMAR, Germany

# 0. include some code segments
. include.sh
plot_gmtset
# 0.1 figset
figset
# 0.2 data set
datapath
dataset
# 1. apply theme
. stdafx.sh 
. styles.sh
MonokaiTheme

# 2. 计算一些信息
preCompute

# plot 
figname=${figname}_geo
# 新版本的gmt有时候psconvert转换pdf不成功，因此这里暂时先用png
fmt=png
gmt begin $figname $fmt,png
    gmt psbasemap -JM$width_fig_x -JZ${width_fig_z}  -R$range_LonLatZ -Ba -BwsenZ -Bza+l"Depth (m)" -pz$angle_view  -TdjBL+o-3.5c/4.5c+w2c+f+lW,,S, --FONT_TITLE=12p --MAP_TITLE_OFFSET=0.1c 
    gmt grdgradient ${bathy} -Az$angle_view -Gtmp.azm=nb/a -Ne0.2
    gmt grdview ${bathy} -JZ -p -C$bathycpt -N${zmin}+g$color_profile -Qi -Itmp.azm 
    gmt makecpt -C128 -T-5,0 -N > tmp.cpt
    gmt grdview ${bathy} -JZ -p -Ctmp.cpt -Qi -Itmp.azm -t$alpha_bathy 
    # add line
    echo $lonc $lat_min >tmp_line
    echo $lonc $lat_max >>tmp_line
    awk 'NR>0 {print $1, $2}' tmp_line |gmt sample1d -I0.1k -AR | gmt grdtrack -G${bathy} | gmt psxyz  -JZ -p -W1,orange 
    # add segments
    awk 'NR>0 {print $1, $2}' $path_segments_SWIR/27.txt|gmt sample1d -I0.1k -AR | gmt grdtrack -G${bathy} | gmt psxyz  -JZ -p -W1,$lc_segments 
    awk 'NR>0 {print $1, $2}' $path_segments_SWIR/28.txt|gmt sample1d -I0.1k -AR | gmt grdtrack -G${bathy} | gmt psxyz  -JZ -p -W1,$lc_segments 
    
    # segments text on seafloor
    # 27
    z_text=`awk 'NR==3 {print $1, $2}' $path_segments_SWIR/27.txt | grdtrack -G${bathy} | awk '{print $3}'`
    awk 'NR==14 {print $1, $2+0, "Segment 27"}' $path_segments_SWIR/27.txt  | gmt pstext -JZ -p -Z$z_text -F+f20p,Helvetica-Bold,red=thinner,$lc_segments+jMC+a180
    # 28
    z_text=`awk 'NR==3 {print $1, $2-0.05}' $path_segments_SWIR/28.txt | grdtrack -G${bathy} | awk '{print $3}'`
    awk 'NR==5 {print $1, $2-0.05, "Segment 28"}' $path_segments_SWIR/28.txt  | gmt pstext -JZ -p -Z$z_text -F+f20p,Helvetica-Bold,red=thinner,$lc_segments+jMC+a180
    
    # profile along lon
    gmt psbasemap -R$range_LonZLat -JX$width_fig_x/$width_fig_z -JZ$width_fig_y -BS -Ba --MAP_FRAME_PEN=1,black@100 --MAP_ANNOT_OFFSET=-0.2  -py$angle_view/$lat_max 
    dxdy=0.01/0.2
    gausshill $range_LonZ $lonc $zc $dxdy $len_lon $len_z
    # 
    # make a mask
    polygon_profile=tmp_polygon_lonprofile.txt
    gmt grdtrack -ERT/LT+i0.2k+d -G$bathy | awk ' {print $1, $4}' >$polygon_profile
    echo $lon_min $zmin >> $polygon_profile
    echo $lon_max $zmin >> $polygon_profile
    gmt grdmask $polygon_profile -R$range_LonZ -I$dxdy -N0/1/1 -Gtmp_mask.nc=nb -V
    gmt grdmath tmp_data_simulation.nc tmp_mask.nc MUL = tmp_data.nc
    gmt grdclip tmp_data.nc -Gtmp_data_clip.nc -Sb0.0001/NaN -V
    # gmt grd2cpt tmp_data_clip.nc -Z -Ccpt-city/imagej/cequal >tmp.cpt
    gmt makecpt -Ccpt-city/imagej/cequal -T0.91/1/0.001 -Z >tmp.cpt
    gmt grdimage -JZ tmp_data_clip.nc -Ctmp.cpt -Q -p -t10
    gmt psxy $polygon_profile -JZ -p -W0.5,black -L 
    echo "$lonc $zc Melt" |gmt pstext -JZ -p -F+f15p,Helvetica-Bold,red=thinner,blue+jCM+a0 -Dj0c/0c
    

    # profile along lat
    gmt psbasemap -R$range_LatZLon -JX$width_fig_y/$width_fig_z -JZ$width_fig_x -BS -Ba --MAP_FRAME_PEN=1,black@100 --MAP_ANNOT_OFFSET=-0.2  -px$angle_view/$lon_min 
    dxdy=0.01/0.2
    gausshill $range_LatZ $latc $zc $dxdy $len_lat $len_z
    # 
    # make a mask
    polygon_profile=tmp_polygon_latprofile.txt
    gmt grdtrack -ELT/LB+i0.2k+d -G$bathy | awk ' {print $2, $4}' >$polygon_profile
    echo $lat_min $zmin >> $polygon_profile
    echo $lat_max $zmin >> $polygon_profile
    gmt grdmask $polygon_profile -R$range_LatZ -I$dxdy -N0/1/1 -Gtmp_mask.nc=nb -V
    gmt grdmath tmp_data_simulation.nc tmp_mask.nc MUL = tmp_data.nc
    gmt grdclip tmp_data.nc -Gtmp_data_clip.nc -Sb0.0001/NaN -V
    # gmt grd2cpt tmp_data_clip.nc -Z -Ccpt-city/imagej/cequal >tmp.cpt
    gmt makecpt -Ccpt-city/imagej/cequal -T0.91/1/0.001 -Z >tmp.cpt
    gmt grdimage -JZ tmp_data_clip.nc -Ctmp.cpt -Q -p -t10
    gmt psxy $polygon_profile -JZ -p -W0.5,black -L 
    echo "$latc $zc AMC" |gmt pstext -JZ -p -F+f15p,Helvetica-Bold,red=thinner,blue+jCM+a0 -Dj0c/0c
    gmt psscale -Ctmp.cpt -Dx$x_colorbar/$y_colorbar+w$width_colorbar/0.3c+h+jLB -Bxa0.02f0.1  -By+lunit --MAP_FRAME_PEN=1p -V
    gmt colorbar -C$bathycpt -Dx$x_colorbar/9.8+w$width_colorbar/0.3c+h+m+jLB -Bxa0.5f0.1  -By+lkm --MAP_FRAME_PEN=1p
    add_logo 12 10 moderngmt -grid=false
gmt end
open $figname.$fmt


# rm gmt.conf gmt.history tmp*
