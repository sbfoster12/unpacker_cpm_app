mkdir -p build
rm -rf build
mkdir -p build
cd build
cmake ..
make -j 4 install
