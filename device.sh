#!/bin/sh
# this is special script for running on jetson nano

export QT_DEBUG_PLUGINS=1
export GST_DEBUG=2

rm -rf build
mkdir build
cd build

echo "Running cmake with build type Debug."
cmake -Wall \
  -G "Unix Makefiles" \
  -DCMAKE_BUILD_TYPE=Debug ..

make

echo "running qml-example"

cd ..
./build/MinimalQml -platform eglfs
