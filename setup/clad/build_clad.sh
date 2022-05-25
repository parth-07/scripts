SCRIPT_DIR=$(dirname ${0})
if ! dpkg -s clang-${1} >/dev/null 2>&1
then
  echo "Installing dependencies."
  ${SCRIPT_DIR}/install_clad_dependencies.sh ${1}
fi

BUILDS_DIR=/home/parth/clubs/open-source/clad/fork/builds

mkdir -p ${BUILDS_DIR}/build-${1}
cd ${BUILDS_DIR}/build-${1}
mkdir -p obj inst
cd obj
rm -rf *
CC="clang-11" CXX="clang++-11" cmake -G Ninja ../../../clad -DClang_DIR=/usr/lib/llvm-${1} -DLLVM_DIR=/usr/lib/llvm-${1} -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../inst -DLLVM_EXTERNAL_LIT="`which lit`"
ninja install