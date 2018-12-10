x0=5
y0=-5

gmt grdmath -R-15/15/-15/15 -I0.1 X $x0 SUB $len_lon DIV DUP Y $y0 SUB $len_z EXCH HYPOT NEG 10 DIV EXP  = sombrero.nc

plotnc.sh sombrero.nc