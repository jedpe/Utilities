#!/bin/bash

mkdir -p ~/R/libs
cd ~/R

# Install xz-5.2.5
wget https://tukaani.org/xz/xz-5.2.5.tar.gz
tar xvzf xz-5.2.5.tar.gz
cd xz-5.2.5
./configure --prefix=$HOME/R/libs
make
make install
cd ~/R

# Install zlib-1.2.11
wget http://zlib.net/zlib-1.2.11.tar.gz
tar xvzf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=$HOME/R/libs
make
make install
cd ~/R

# Install curl-7.77.0
wget https://curl.se/download/curl-7.77.0.tar.gz
tar xvzf curl-7.77.0.tar.gz
cd curl-7.77.0
./configure --prefix=$HOME/R/libs
make
make install
cd ~/R

# Install bzip2-1.0.6
wget https://sourceforge.net/projects/bzip2/files/bzip2-1.0.6.tar.gz
tar xvzf bzip2-1.0.6.tar.gz
cd bzip2-1.0.6
make
make install
cd ~/R

# Install pcre2-10.37
wget https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.gz
tar xvzf pcre2-10.37.tar.gz
cd pcre2-10.37
./configure --enable-utf8 --prefix=$HOME/R/libs
make
make install
cd ~/R

# Build R-4.10
wget https://cran.r-project.org/src/base/R-4/R-4.1.0.tar.gz
tar xvzf R-4.1.0.tar.gz
cd R-4.1.0
CPPFLAGS=-I$HOME/R/libs/include LDFLAGS="-L$HOME/R/libs/lib -Wl,-rpath=$HOME/R/libs/lib" ./configure --prefix=$HOME/R/R-4.1.0 --with-cairo --with-blas --with-lapack --enable-R-shlib --with-valgrind-instrumentation=2 --enable-memory-profiling
make
make check
make check-all
