
![Win 10 & Ubuntu](https://upload-images.jianshu.io/upload_images/7316098-078cce35741f35e1.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> GMT安装方法有好几种：（1）从官方发布的二进制文件安装；（2）在Mac, Linux系统下有自动安装命令；（3）从源码编译安装。第三种方法有利于体验最新版(开发版)的新功能，因为官方发布的稳定版本往往会比开发版晚很多！方便进行同步更新；有利于二次开发，加入自己的功能或者做一定的修改！本帖一步一步说明如何在Ubuntu系统下从源码安装GMT，对于win 10用户，[需要开启subsystem](https://www.jianshu.com/p/334dcca006f7)！


根据gmt[官方说明](https://github.com/GenericMappingTools/gmt)首先安装所需的库

# 编译工具
编译工具包括gcc, g++, gfortran, make, cmake。首先在终端查看诸工具是否已经安装：比如`gcc --version`，如果没有安装或者不够新，可使用自动安装命令安装之，比如: `sudo apt-get install g++`。

> 但是CMake貌似不能用apt-get安装，下面给出从源码安装最新版cmake的方法

## [cmake](https://cmake.org/download/)
1. [下载](https://cmake.org/files/v3.13/cmake-3.13.0-rc1.tar.gz)
2. 解压：`tar -zxvf cmake-3.13.0-rc1.tar.gz `
3. 配置：`make build `,  `cd build`, `../configure --prefix=/usr/local`
4. `make`
5. `make install`

# 安装GMT依赖库

## [netcdf](https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-4.6.1.tar.gz)
 [github仓库](http://github.com/Unidata/netcdf-c)
### netCDF依赖库
#### m4
安装 `sudo apt-get install m4`

#### [HDF5](https://support.hdfgroup.org/HDF5/release/obtainsrc518.html#conf)
1. [下载](https://support.hdfgroup.org/ftp/HDF5/current18/src/hdf5-1.8.20.tar)
2. 解压：`tar xvf hdf5-1.8.20.tar`
3. configure：`mkdir build` `cd build` `../configure --prefix=/usr/local`
4. `make `
... 等待 ....
5. `make install` or `sudo make install`

### [curl](https://curl.haxx.se/download.html)

> 因为编译netcdf需要用到curl的源码，我喜欢从源码安装。如果后面make netcdf的时候出现错误，可以尝试将从apt-get安装的curl卸载掉：`sudo apt-get autoremove curl`

1. [下载](https://curl.haxx.se/download/curl-7.61.1.tar.gz)
2. 解压：`tar -zxvf curl-7.61.1.tar.gz`
2. config: `mkdir build`  `cd build`  `../configure --prefix=/usr/local`
2. make: `make`
2. install: `make install`

> 此时如果再不提示缺什么库的话，应该会顺利通过。如果缺什么库，编译过程中会提示缺什么，继续安装所缺库即可

### 安装netCDF
1. 解压： `tar -zxvf netcdf-4.6.1.tar.gz`
1. `mkdir build` `mkdir bin`
1. `cd build`
1. `../configure --prefix=/usr/local` 或者其他的什么你想安装到的目录
1. `make`
... 等待 ...
1. `make install`


## [GDAL](https://www.gdal.org/index.html)

1. [下载](http://download.osgeo.org/gdal/2.3.2/gdal-2.3.2.tar.gz)
2. 解压：`tar -zxvf gdal-2.3.2.tar.gz`
2. config: `cd gdal-2.3.2`  `../configure --prefix=/usr/local` **注意**：直接在主目录下面配置和make，不要创建build目录，不然会出现没有make目标的错误。
2. make: `make`
此过程等待时间非常长....
2. install: `make install`

## [PCRE](https://www.pcre.org/)
1. [下载](ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.42.tar.gz)
2. 解压：`tar -zxvf pcre-8.42.tar.gz`
2. config: `mkdir build`  `cd build`  `../configure --prefix=/usr/local`
2. make: `make`
2. install: `make install`

> 出现了几个警告：`libtool: warning: relinking 'libpcreposix.la'`, `libtool: warning: relinking 'libpcrecpp.la'`先不管

## [BLAS](http://www.netlib.org/blas/)
1. [下载](http://www.netlib.org/blas/blas-3.8.0.tgz)
2. 解压：`tar -zxvf blas-3.8.0.tgz`
3. 编译生成libblas.so：`gfortran -shared -O2 *.f -o libblas.so -fPIC`
4. 添加环境变量到`~/.zshrc`: `export LIBPATH=/mnt/d/Research/gmt/library/BLAS-3.8.0/libblas.so:$LIBPATH`

## [LAPACK](http://www.netlib.org/lapack/#_lapack_version_3_1)
1. [下载](http://www.netlib.org/lapack/lapack-3.8.0.tar.gz)
2. 解压：`tar -zxvf lapack-3.8.0.tar.gz`
2. 拷贝make.inc：`cp make.inc.example make.inc`
3. 添加` -fPIC`到`OPTS`和`NOOPT`
```bash
OPTS    = -O2 -frecursive fPIC
DRVOPTS = $(OPTS)
NOOPT   = -O0 -frecursive fPIC
```
4. 修改lib名称
```bash
BLASLIB = ../../librefblas.so
LAPACKLIB = liblapack.so
```
5. 修改SRC/makefile
将
```bash
../$(LAPACKLIB): $(ALLOBJ)
	$(ARCH) $(ARCHFLAGS) $@ $(ALLOBJ)
	$(RANLIB) $@
```
改为
```bash
../$(LAPACKLIB): $(ALLOBJ)
    $(LOADER) $(LOADOPTS) -shared -Wl,-soname,liblapack.so -o $@ $(ALLOBJ) ../librefblas.so
```
6. 修改BLAS/SRC/Makefile
将
```bash
$(BLASLIB): $(ALLOBJ)
	$(ARCH) $(ARCHFLAGS) $@ $(ALLOBJ)
	$(RANLIB) $@
```
改为
```bash
$(BLASLIB): $(ALLOBJ)
	$(LOADER) $(LOADOPTS) -z muldefs -shared -Wl,-soname,librefblas.so -o $@ $(ALLOBJ)
```
> 如果你没有g77编译器，请将第2步拷贝的make.inc文件中的两个`g77`更换为你的fortran编译器比如`gfortran`

7. make
```
make blaslib
make lapacklib
```
8. 添加环境变量： `export LIBPATH=/mnt/d/Research/gmt/library/BLAS-3.8.0/libblas.so:/mnt/d/Research/gmt/library/lapack-3.8.0/liblapack.so:$LIBPATH`


## 安装OpenMP库
`sudo apt-get install libomp-dev`

## [FFTW](https://github.com/FFTW/fftw3)
1. [下载](http://fftw.org/fftw-3.3.8.tar.gz)
2. 解压：`tar -zxvf fftw-3.3.8.tar.gz`
3. 配置：`make build `,  `cd build`, `../configure --prefix=/usr/local`
4. `make`
5. `make install`

## Ghostscript
`sudo apt-get update`
` sudo apt-get install ghostscript`

## 配置数据
下载
1. [GSHHG](ftp://ftp.soest.hawaii.edu/gshhg/gshhg-gmt-2.3.7.tar.gz)
2. [DCW-GMT](ftp://ftp.soest.hawaii.edu/dcw/dcw-gmt-1.1.4.zip)

设置路径: 环境变量
1. `GSHHG_PATH`
2. `DCW_PATH`


# 编译gmt
```bash
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
make -j
```

# 保持与官方仓库同步更新(针对二次开发者)
1. 查看目前的远程仓库地址：`git remote -v`
3. 添加官方仓库：`git remote add upstream https://github.com/GenericMappingTools/gmt.git`
其中**upstream**是官方仓库，**orgin**是你fock之后存在你自己的github账户里的仓库
4. 拉取官方仓库更新：`git fetch upstream`
5. 切换到自己的分支，比如master：`git checkout master`
6. 与官方更新合并：`git merge upstream/master`
7. 修改远程push仓库地址：`git remote set-url origin xxxx.git`
8. 删除远程仓库地址:`git remote rm origin`

> 如果发现在终端不能直接用`gmt`命令，每次在终端输入gmt会出现这个错误：`fatal: Not a git repository (or any of the parent directories): .git`，那是因为安装了git的插件的原因。一般这个是由于on my zsh引起的，gmt这个词被定义为了 **alias g./home/zguo/.oh-my-zsh/plugins/git/git**，定义的文件为:`/home/zguo/.oh-my-zsh/plugins/git/git.plugin.zsh`，找到这个文件打开之后把这一行注释掉，然后重新source一下或者重新打开一下终端就好了。
**Mac系统下也是一样的操作！**