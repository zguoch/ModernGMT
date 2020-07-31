# Test 3D View of GMT: geographic project example
# Zhikui Guo, 2018-12-09, GEOMAR, Germany

# 0. include some code segments
. stdafx.sh
. include.sh
plot_gmtset
# 0.1 figset
figset
# 0.2 data set
datapath
dataset
# 1. apply theme
# MonokaiTheme
DarkTheme

# 2. 计算一些信息
preCompute

# plot 
figname=${figname}_geo
# 新版本的gmt有时候psconvert转换pdf不成功，因此这里暂时先用png
fmt=pdf
gmt begin $figname $fmt,png

    # seafloor basemap
    gmt psbasemap -JM$width_fig_x -JZ${width_fig_z}  -R$range_LonLatZ -Bxa20f20 -Bya20f20 -BwsZ -Bza+l"Depth (m)" -pz$angle_view  -Tdj${prop_rose} --FONT_TITLE=12p --MAP_TITLE_OFFSET=0.1c 
    gmt grdgradient ${bathy} -Az$angle_view -G$bathy_azm=nb/a -Ne0.2
    gmt grdview ${bathy} -JZ -p -C$bathycpt -N${zmin}+g$color_profile@$alpha_profile -Qi -I$bathy_azm -t$alpha_bathy 
    # gmt makecpt -C128 -T-5,0 -N > tmp.cpt
    # gmt grdview ${bathy} -JZ -p -Ctmp.cpt -Qi -t$alpha_bathy 
    gmt psscale -C$bathycpt -Dx$x_colorbar/$y_colorbar+w$width_colorbar/0.3c+h+jLB -Bxa2f0.4 --MAP_FRAME_PEN=1p  -By+lkm  -V
    # add text
    z_text=`echo 20 -22 | gmt grdtrack -G${bathy}| awk '{print $3}'`
    echo $z_text
    echo "20" "-22" "Africa" | gmt pstext -JZ -Z$z_text -p -F+f20p,Helvetica-Bold,black=thinner,white+jMC+a0
    #  add MOR
    awk 'NR>0 {print $1, $2}' $path_MOR/SWIR.txt | gmt grdtrack -G${bathy} | gmt psxyz  -JZ -p -W1p,$lc_segments 
    awk 'NR>0 {print $1, $2}' $path_MOR/SWIR.txt | gmt grdtrack -G${bathy} | gmt psxyz  -JZ -p -W1p,$lc_segments 
    z_text=`awk 'NR==10 {print $1, $2}' $path_MOR/SWIR.txt | gmt grdtrack -G${bathy} | awk '{print $3}'`
    awk 'NR==30 {print $1, $2-2, "SWIR"}' $path_MOR/SWIR.txt | gmt pstext -JZ -Z$z_text -p -F+f20p,Helvetica-Bold,red=thinner,white+jMC+a3
    awk 'NR>0 {print $1, $2}' $path_MOR/CIR.txt | gmt grdtrack -G${bathy} | gmt psxyz  -JZ -p -W1p,$lc_segments 
    awk 'NR>0 {print $1, $2}' $path_MOR/SEIR.txt | gmt grdtrack -G${bathy} | gmt psxyz  -JZ -p -W1p,$lc_segments 
    z_text=`awk 'NR==15 {print $1, $2}' $path_MOR/SEIR.txt | gmt grdtrack -G${bathy} | awk '{print $3}'`
    awk 'NR==15 {print $1, $2-2, "SEIR"}' $path_MOR/SEIR.txt | gmt pstext -JZ -Z$z_text -p -F+f20p,Helvetica-Bold,red=thinner,white+jMC+a-30
    # add two profiles
    echo $lon_longqi $lat_min $lat_max | awk '{printf "%f %f\n%f %f\n", $1, $2, $1, $3}' | gmt sample1d -I5k -AR | gmt project -C$lon_longqi/$lat_min -Q |awk '{print $1, $2, $3}' >profile_lon.xyd
    awk '{print $1, $2}' profile_lon.xyd |gmt grdtrack -G${bathy} |  gmt psxyz -JZ -p -W1,green 
    echo $lat_longqi $lon_min $lon_max | awk '{printf "%f %f\n%f %f\n", $1, $2, $1, $3}' | gmt sample1d -I5k -AR |awk '{print $2, $1}'| gmt project -C$lon_min/$lat_longqi -Q |awk '{print $1, $2, $4}'>profile_lat.xyd 
    awk '{print $1, $2}' profile_lat.xyd |gmt grdtrack -G${bathy} | gmt psxyz -JZ -p -W1,green 
    # 龙旗位置
    echo $lon_longqi $lat_longqi | gmt grdtrack -G${bathy} | gmt psxyz -JZ -p -Sa0.5c -Gred -W1.5,yellow  
    z_text=`echo $lon_longqi $lat_longqi |awk '{print $1, $2-5}' | gmt grdtrack -G${bathy}| awk '{print $3}'`
    echo $z_text
    echo $lon_longqi $lat_longqi "Longqi" |awk '{print $1, $2-5, $3}' | gmt pstext -JZ -Z$z_text -p -F+f20p,Helvetica-Bold,red=thinner,yellow+jMC+a0
    
    # profile along lon
    gmt psbasemap -R$range_LonZLat -JX$width_fig_x/$width_fig_z -JZ$width_fig_y -BS -Ba --MAP_FRAME_PEN=1,black@100 --MAP_ANNOT_OFFSET=$offset_ticklabel_lat  -py$angle_view/$pos_profile_lat
    # plot s wave velocity on the profile
    ymin_profile_vel=`grdinfo $nc_profile_lat| grep "y_min" | awk '{print $3}'`
    ymax_profile_vel=`grdinfo $nc_profile_lat| grep "y_min" | awk '{print $5}'`
    xrange_profile_vel=$lon_min/$lon_max 
    range_profile_vel=$xrange_profile_vel/$ymin_profile_vel/$ymax_profile_vel
    gmt grdedit $nc_profile_lat -R$range_profile_vel -Gtmp_vel.nc
    gmt grd2cpt tmp_vel.nc -C$basecpt_vel -Z >vel.cpt 
    gmt grdimage tmp_vel.nc -Cvel.cpt -JZ -py$angle_view/$lat_min -t$alpha_profile
    gmt grdcontour tmp_vel.nc -C0.2 -JZ -p 
    echo $lonc $zc "S Wave Velocity"  | gmt pstext -JZ -p -F+f20p,Helvetica-Bold,$lc_segments=thinner,red+jMC+a0
    
    # # profile along lat
    width_fig_y0=`echo $width_fig_y | awk '{print $1+0.3}'`
    gmt psbasemap -R$range_LatZLon -JX$width_fig_y/$width_fig_z -JZ$width_fig_x -BS -Ba --MAP_ANNOT_OFFSET=$offset_ticklabel_lon  -px$angle_view/$pos_profile_lon
    ymin_profile_vel=`grdinfo $nc_profile_lon| grep "y_min" | awk '{print $3}'`
    ymax_profile_vel=`grdinfo $nc_profile_lon| grep "y_min" | awk '{print $5}'`
    xrange_profile_vel=$lat_min/$lat_max 
    range_profile_vel=$xrange_profile_vel/$ymin_profile_vel/$ymax_profile_vel
    gmt grdedit $nc_profile_lon -R$range_profile_vel -Gtmp_vel.nc
    gmt grdimage tmp_vel.nc -Cvel.cpt -JZ -px$angle_view/$lon_min -t$alpha_profile
    gmt grdcontour tmp_vel.nc -C0.1 -JZ -p
    echo $latc $zc "SL2013sv Model"  | gmt pstext -JZ -p -F+f20p,Helvetica-Bold,$lc_segments=thinner,red+jMC+a0
    gmt psscale -Cvel.cpt -Dx$x_colorbar_vel/$y_colorbar_vel+w$width_colorbar/0.3c+h+jRB -Bxa0.2f0.04 --MAP_FRAME_PEN=1p   -By+lkm/s  -V
    add_logo 10.8 7 moderngmt -grid=false
gmt end
open $figname.$fmt


rm gmt.conf gmt.history tmp*


