
# ModernGMT

ModernGMT是基于GMT官方开发版进行自定义新功能的私房版本。

## 安装方法

1. [**从源码安装**](install.md)

2. ![下载](https://img.shields.io/badge/二进制-安装包-orange.svg)   [![download](https://img.shields.io/badge/OSX-下载(制作中...)-green.svg)](www.modernfig.cn)  [![download](https://img.shields.io/badge/Windows-下载(制作中...)-green.svg)](www.modernfig.cn)  [![download](https://img.shields.io/badge/Linux-下载(制作中...)-green.svg)](www.modernfig.cn)


## Change Log

### 漏洞修复

#### 1. **三维视图**

*  **修复的主要漏洞**：剖面切片位置错乱、坐标轴文字镜像、剖面上的文字镜像和旋转。

* **修改文件**：gmt_plot.c, pstext.c, postscriptlight.c

* **新增函数**：`gmt_plot.c: AxisTickLabel_Flip_GMT_X_Y` ；
 `gmt_plot.c: AxisLable_Flip_GMT_X_Y`； 
 `pstext.c: Text_Flip_GMT_X_Y` ；
 `postscript.c: PSL_plottext_mirror`. 


### 新增功能


### 测试

1. 三维视图

2. 自定义logo

3. 饼图

4. 读取[Gmsh](http://gmsh.info)的.msh文件绘制mesh
