BUILD_ROOT="/home/parth/clubs/open-source/LLVM/fork/build"
LLVM_ROOT="/home/parth/clubs/open-source/LLVM/fork/LLVM"

if [ ! -d "${BUILD_ROOT}/obj" ]
then
echo "Build directory do not exist! Run build-llvm.sh instead"
exit 1
fi

cd "${BUILD_ROOT}/obj"
ninja install