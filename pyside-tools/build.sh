#!/bin/bash

mkdir build
cd build
which qmake
cmake \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_RPATH=$LD_RUN_PATH \
    -DPYTHON_EXECUTABLE=$PYTHON \
    -DLIB_INSTALL_DIR=$PREFIX/lib \
    -DShiboken_DIR=$PREFIX \
    -DPySide_DIR=$PREFIX \
    -DQT_MOC_EXECUTABLE=/usr/bin/moc \
    -DQT_RCC_EXECUTABLE=/usr/bin/rcc \
    -DQT_UIC_EXECUTABLE=/usr/bin/uic \
    ..
make
make install

# ----------------------------------------------------------

LIB=$PREFIX/lib
SP=$LIB/python2.7/site-packages

if [ `uname` == Darwin ]; then
    cp -r /Library/Python/2.7/site-packages/pysideuic $SP
    cp /usr/bin/pyside-rcc $PREFIX/bin
    cp /usr/bin/pyside-uic $PREFIX/bin
    cp /usr/bin/pyside-lupdate $PREFIX/bin
fi
