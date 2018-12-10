path_data=/MyData/Research/0-Phd/Data/GlobalGeophysicalData/SL2013sv/SL2013sv_0.5d-grd_v2.1

grep "^150.0 " $path_data/SL2013sv_n-0.5d.mod | awk '{print $2,$3,$7/1000}' | xyz2grd -Dm/m/m/1/0/=/= -G0150.g.abs.grd -Rd -I0.5 -fog
grep "^150.0 " $path_data/SL2013sv_n-0.5d.mod | awk '{print $2,$3,$6}' | xyz2grd -Dm/m/m/1/0/=/= -G0150.g.3DP.grd -Rd -I0.5 -fog
grep "^150.0 " $path_data/SL2013sv_n-0.5d.mod | awk '{print $2,$3,$9}' | xyz2grd -Dm/m/m/1/0/=/= -G0150.g.dmP.grd -Rd -I0.5 -fog
makecpt -Chaxby -T`grdinfo -C 0150.g.abs.grd | awk '{print $6"/"$7"/"($7-$6)/20}'` -D -I > 0150.abs.cpt
makecpt -Chaxby -T-8/8/1 -D -I > 0150.P.cpt
# plot
(grdview -JN0/5i -Rd -Qi300 -Ba90f30/a30f15 -C0150.abs.cpt 0150.g.abs.grd -K ; \
	pscoast -J -R -Di -A5000 -W0.5p -N1/0.3p,30 -O -K ; \
        psscale -D2.5/-0.25/2/0.15h -C0150.abs.cpt -Ba0.25g0.25:"150 km": -O) > 0150.abs.ps