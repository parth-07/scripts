BUILD_ROOT="/home/parth/clubs/open-source/LLVM/fork/builds/build-${1}"
LLVM_ROOT="/home/parth/clubs/open-source/LLVM/fork/llvm-project"

rm -rf "${BUILD_ROOT}/obj"

if [ -d "${BUILD_ROOT}/obj" ]
then
echo "Build folders already exists! run update-llvm.sh instead"
exit 1
fi

mkdir -p "${BUILD_ROOT}/obj" "${BUILD_ROOT}/inst"
cd "${BUILD_ROOT}/obj"

cmake -G Ninja "${LLVM_ROOT}/llvm" -DLLVM_USE_LINKER=gold -DCMAKE_BUILD_TYPE=Debug \
-DLLVM_TARGETS_TO_BUILD="host;NVPTX" -DBUILD_SHARED_LIBS=On \
-DLLVM_USE_SPLIT_DWARF=On -DLLVM_OPTIMIZED_TABLEGEN=On \
-DLLVM_ENABLE_PROJECTS="clang" \
-DCMAKE_INSTALL_PREFIX="${BUILD_ROOT}/inst"

ninja install