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

DarkTheme


figname=sphere
fmt=pdf
ro=1000;
xmin=-20
xmax=20
ymin=-20
ymax=20
zmin=-25
zmax=0
range=$xmin/$xmax/$ymin/$ymax/$zmin/$zmax 
range_xy=$xmin/$xmax/$ymin/$ymax
azim=125
elevation=25
angle_view=$azim/$elevation
figwidth_x=12
figwidth_y=12
figwidth_z=7.5
gmt begin $figname $fmt 
# calculate gravity
gmt gmtgravmag3d -Tr@sphere_raw.txt -C$ro -R$range_xy -I0.5 -Ggrav.nc
gmt basemap -JX$figwidth_x/$figwidth_y -JZ$figwidth_z -R$range -pz$angle_view -BwSEnZ -Bxa5f1+l"x(m)" -Bya5f1+l"y(m)" -Bza5f1g1+l"z(m)" -X2c
awk '{print $1, $2, $3"\n", $4, $5, $6"\n", $7, $8,$9"\n>>"}' sphere_raw.txt |gmt psxyz -JZ  -Gred@50 -W0p,black@50 -p

gmt grdgradient grav.nc -Az$angle_view -Gtmp.azm=nb/a -Ne0.2
gmt grdview grav.nc -Crainbow -Qi -JZ  -p -t50 -N$zmin+ggray
# gmt grdimage grav.nc -Crainbow -JZ -p$angle_view/0
gmt end

open $figname.$fmt