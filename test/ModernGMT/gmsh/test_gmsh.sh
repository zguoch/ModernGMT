function get_range()
{
    filename=$1
    gmtinfo $filename
}

xmin=-600
xmax=600
ymin=-400
ymax=-0
range=$xmin/$xmax/$ymin/$ymax 
xy_msh=Mesh_smoker_pipe_curve
get_range $xy_msh.xy
figname=gmt_gmsh
fmt=pdf

gmt begin $figname $fmt 
    gmt basemap -R$range -JX12/6c -Bya100 -Bxa200 -BWSen
    # gmt makecpt -Crainbow -T1/3 >phase.cpt
    gmt psxy $xy_msh.xy -W0p -C$xy_msh.cpt
    # gmt colorbar -CMESH_MultiFaults.cpt -Np -Dg0/-2+w5c+h -Bxa0.5 --MAP_FRAME_PEN=1p
gmt end
open $figname.$fmt