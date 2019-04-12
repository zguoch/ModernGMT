#!/bin/bash
gmt math -T10/30/1 T 20 SUB 10 DIV 2 POW 41.5 ADD = line.txt

gmt begin GMT_linearrow ps
# -JM5i时，转换pdf会出错，改为-JX则通过
gmt psxy line.txt -R8/32/40/44 -JX5i/2i -Ba -V 
gmt psxy line.txt -W2p+o1c/500k+vb0.2i+gred+pfaint+bc+ve0.3i+gblue+h0.5 
gmt end
# gmt psconvert GMT_linearrow.ps -Tp -Au -V
open GMT_linearrow.pdf