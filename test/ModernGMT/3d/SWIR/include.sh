
function plot_gmtset()
{
    # --------------------figure set--------------------
    # gmt gmtset GMT_LANGUAGE=CN1
    # gmt gmtset PS_MEDIA=A1   #此选项在Modern模式下不支持
    # 设置纬度标注与坐标轴平行，只对经纬度起作用，线性投影使用 --MAP_ANNOT_ORTHO=,,,,
    gmt set MAP_ANNOT_OBLIQUE 32
    # 
    gmt gmtset MAP_FRAME_PEN=1p #坐标轴线宽
    gmt gmtset MAP_FRAME_WIDTH=3p #控制火车道宽度
    # gmt gmtset FONT=9p,Helvetica,red
    # gmt gmtset MAP_ANNOT_ORTHO=WESNZ
    # gmt gmtset MAP_FRAME_AXES=WESN
    # gmt gmtset FONT_ANNOT=9p,Helvetica,red
    gmt gmtset FONT_ANNOT_PRIMARY=12p,Helvetica,black  #坐标标注label
    # gmt gmtset FONT_TITLE=9p,Helvetica,black   #标题，rose的WSEN字也是title
    gmt gmtset FONT_LABEL=12p,Helvetica,black  #做标注的title
    # gmt gmtset FONT_HEADING=9p,Helvetica,red
    # gmt gmtset FONT_ANNOT=9p,Helvetica,red
    # gmt gmtset FONT_ANNOT_SECONDARY=9p,Helvetica,red
    # gmt gmtset FONT_ANNOT_PRIMARY=9p,Helvetica,red
    gmt gmtset MAP_FRAME_TYPE=fancy+
    # gmt gmtset MAP_ANNOT_ORTHO=we
    # gmt set FORMAT_GEO_MAP +ddd:mmF
}
function figset()
{
    figname=Test_3d
    # 旋转角度控制
    azimuth=225
    elevation=20
    angle_view=$azimuth/$elevation
    width_fig_x=10
    width_fig_y=10
    width_fig_z=7
    # colorbar
    x_colorbar=-0.8
    y_colorbar=7.5
    x_colorbar_vel=12
    y_colorbar_vel=0.2
    width_colorbar=4
    # alpha
    alpha_profile=50
    alpha_bathy=5    #0表示不透明，100表示全透明,地形上面的覆盖层的透明度
    # color
    color_profile=lightgray     #三维剖面颜色
    color_secondaryProfile=white
    lc_segments=white
    # move
    move_x=0
    move_y=0
}
function getProfilePos()
{
    # 第一种情况
    if [ "$azimuth" -le "90" ]; then
    echo "lat_max lon_max"
    pos_profile_lon=$lon_max 
    pos_profile_lat=$lat_max
    offset_ticklabel_lat=0
    offset_ticklabel_lon=-0.2
    prop_rose=MR+o-4c/0c+w2c+f+lW,,S,
    # 第二种情况
    elif [ "$azimuth" -le "180" ]; then
    echo "lat_max lon_min"
    pos_profile_lon=$lon_max
    pos_profile_lat=$lat_min
    offset_ticklabel_lat=0
    offset_ticklabel_lon=0
    prop_rose=BC+o0c/-4c+w2c+f+lW,,S,
    # fi
    # 第三种情况
    elif [ "$azimuth" -le "270" ]; then
    echo "lat_min lon_min"
    pos_profile_lon=$lon_min
    pos_profile_lat=$lat_min
    offset_ticklabel_lat=0
    offset_ticklabel_lon=0
    prop_rose=ML+o-4.5c/0c+w2.5c+f+lW,,,N
    # fi
    # 第四种情况
    elif [ "$azimuth" -gt "270" ]; then
    echo "lat_min lon_max"
    pos_profile_lon=$lon_min 
    pos_profile_lat=$lat_max
    offset_ticklabel_lat=0
    offset_ticklabel_lon=-0.2
    prop_rose=TC+o0c/-4c+w2c+f+l,E,,N
    fi
}
function datapath()
{
    path_segments_SWIR=/MyData/Research/2-Paper/4_Numerical_Longqi/data/segments/
    path_MOR=/MyData/Research/2-Paper/4_Numerical_Longqi/data/MOR
    nc_profile_lon=profile_lon.xyd_vel.nc 
    nc_profile_lat=profile_lat.xyd_vel.nc
}
function dataset()
{
    xmin=0
    xmax=100
    ymin=0
    ymax=50
    zmin=-400
    zmax=-2
    xc=`echo $xmin $xmax | awk '{print $1+($2-$1)/2}'`
    yc=`echo $ymin $ymax | awk '{print $1+($2-$1)/2}'`
    zc=`echo $zmin $zmax | awk '{print $1+($2-$1)/2}'`
    len_z=`echo $zmin $zmax | awk '{print ($2-$1)}'`
    range_xy=$xmin/$xmax/$yminn/$ymax
    range_z=$zmin/$zmax
    range_xyz=$range_xy/$range_z
    # get bathymetry of a rigion
    lon_min=0
    lon_max=90
    lat_min=-67
    lat_max=-18
    lon_longqi=49
    lat_longqi=-37
    getProfilePos    #根据旋转角度和经纬度范围设置剖面显示的位置
    len_lon=`echo $lon_min $lon_max | awk '{print ($2-$1)}'`
    len_lat=`echo $lat_min $lat_max | awk '{print ($2-$1)}'`
    scale_z=7  #z轴与横向的尺度比例，用于计算z轴的长度
    bathy=bathy_swir.nc
    bathycpt=bathy.cpt
    bathy_azm=bathy.azm
    cpt_base=cpt-city/mby/mby
    basecpt_vel=cpt-city/arendal/temperature
    cutBathy $bathy $cpt_base
    range_LonZ=$lon_min/$lon_max/$zmin/$zmax
    range_LatZ=$lat_min/$lat_max/$zmin/$zmax
    range_LonLatZ=$lon_min/$lon_max/$lat_min/$lat_max/$zmin/$zmax
    range_LonZLat=$lon_min/$lon_max/$zmin/$zmax/$lat_min/$lat_max
    range_LatZLon=$lat_min/$lat_max/$zmin/$zmax/$lon_min/$lon_max
    # 生成数据
    data_simu=tmp_data_simulation.nc
    
}
function cutBathy()
{
    etopo_save=$1
    incpt=$2
    etopo1=/MyData/Research/0-Phd/Data/GlobalGeophysicalData/ETOPO1_Bed_g_gdal.nc
    range_lonlat=$lon_min/$lon_max/$lat_min/$lat_max 
    gmt grdsample ETOPO1.nc -R$range_lonlat -G$etopo_save -I10m
    gmt grdmath $etopo_save 0.001 MUL = $etopo_save
    # make cpt
    gmt grd2cpt $etopo_save -C$incpt -Z >$bathycpt
}
# dark theme
function MonokaiTheme()
{
    gmt set PS_PAGE_COLOR=46/42/46
    # gmt set FONT_ANNOT_PRIMARY=12p,Helvetica,white
    gmt set FONT=,,white
    gmt set MAP_DEFAULT_PEN=white
    gmt set MAP_FRAME_PEN=thicker,white
    gmt set MAP_TICK_PEN_PRIMARY=,white
    # --------color set -------------------
    lc_segments=gray

    figname=${figname}_DarkTheme
}
function DarkTheme()
{
    gmt set PS_PAGE_COLOR=black
    # gmt set FONT_ANNOT_PRIMARY=12p,Helvetica,white
    gmt set FONT=,,white
    gmt set MAP_DEFAULT_PEN=white
    gmt set MAP_FRAME_PEN=thicker,white
    gmt set MAP_TICK_PEN_PRIMARY=,white
    # --------color set -------------------
    lc_segments=gray

    figname=${figname}_DarkTheme
}
function preCompute()
{
    # ======计算范围
    R_earth=6371   #地球半径
    lonc=`echo $lon_min $lon_max | awk '{print $1+($2-$1)/2}'`
    latc=`echo $lat_min $lat_max | awk '{print $1+($2-$1)/2}'`
    zmax_JP=`echo $zmax $R_earth | awk '{print $1+$2}'`
    zmin_JP=`echo $zmin $R_earth | awk '{print $1+$2}'`
    # --------提取数据：切去目标区域-----------
    # 利用gmt的grdtrack截取数据中间沿着经度方向的一条剖面并用+d命令计算距离
    length_lon=`gmt grdtrack -ELM/RM+i0.2k+d -G$bathy | awk 'END {print $3}'`
    # awk '{print $1, $2}' | gmt psxy -R -J -Sc0.1c -Gred -Wblack -p -O -K >>${ps}
    # 按定比例计算深度方向的大小
    length_lat=`gmt grdtrack -EBC/TC+i0.2k+d -G$bathy | awk 'END {print $3}'`
    width_fig_y=`echo $width_fig_x $length_lon $length_lat| awk '{print $1/$2*$3}'`
    # awk '{print $1, $2}' | gmt psxy -R -J -Sc0.1c -Gred -Wblack -p -O -K >>${ps}
    # 按定比例计算深度方向的大小
    length_z=`echo $zmin $zmax | awk '{print ($2-$1)}'`
    width_fig_z=`echo $width_fig_x $length_lon $length_z $scale_z | awk '{print $3/$2*$1*$4}'`
    echo "东西向(km):"$length_lon "南北向(km):"$length_lat "深度(km):"$length_z "宽(x方向):"$width_fig_x "长度(y方向): "$width_fig_y "高:"$width_fig_z 
    
}

function gausshill()
{
    # exp(-r/factor), r=(x-x0)^2+(y-y0)^2
    range=$1
    x0=$2
    y0=$3
    dxdy=$4
    length_x=$5
    length_y=$6
    factor=10
    gmt grdmath -R$range -I$dxdy X $x0 SUB $length_x DIV DUP Y $y0 SUB $length_y DIV EXCH HYPOT NEG $factor DIV EXP  = $data_simu
}