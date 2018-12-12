. styles.sh
MonokaiTheme

figname=bathy_swir
fmt=pdf
gmt begin bathy_swir $fmt,png
    figwidth=10
    lat_max=-10
    range=0/70/-50/$lat_max
    # 1. 在ETOPO1中以10分的间隔重采样，西南印度洋区域
    gmt grdsample ETOPO1.nc -R$range -I10m -Getopo.nc
    gmt grd2cpt etopo.nc -Cetopo1 -Z >etopo.cpt
    gmt grdimage etopo.nc -Cetopo.cpt -R$range -JM$figwidth -Ba -BWSen
    gmt colorbar -Cetopo.cpt -Dg0/$lat_max+w$figwidth+h+jBL+m+o0/0.3c -Bxa2000f400 -By+l"m"
    # 2. 在grav.23.nc中截取同样的范围(http://science.sciencemag.org/content/346/6205/65)
    gmt grdsample grav.23.nc -R$range -I10m -Ggrav.nc
    move_x=`echo $figwidth | awk '{print $1*1.1}'`
    gmt grd2cpt grav.nc -Crainbow -Z >grav.cpt 
    gmt grdimage grav.nc -Cgrav.cpt -R$range -JM$figwidth -Ba -BwSEn -X$move_x
    gmt colorbar -Cgrav.cpt -Dg0/$lat_max+w$figwidth+h+jBL+m+o0/0.3c -Bxa100f20 -By+l"mGal"
gmt end
open $figname.$fmt