# Test Figure 1 of Oliver 2015 Science
# Sensitivity of seafloor bathymetry to climate-driven fluctuations in mid-ocean ridge magma supply
# Zhikui Guo, 2018-12-10, GEOMAR, Germany
# Data from NOAA(NGDC): https://www.ngdc.noaa.gov/ships/melville/PANR04MV_mb.html
# 下载的多波束数据是原始数据，没法处理，这个例子先暂时搁置，有数据了再说

# 0. include head file 
. include.sh

plot_gmtset
# 0.1 figset
figset
# 0.2 data set
datapath
dataset
# 1. apply theme
MonokaiTheme

# 2. 计算一些信息
preCompute