#!/usr/bin/env bash
SCRIPT_DIR=$(dirname ${0})
# if ! dpkg -s clang-${1} >/dev/null 2>&1
# then
#   echo "Installing dependencies."
#   ${SCRIPT_DIR}/install_clad_dependencies.sh ${1}
# fi

if [ -n "${2}" ]; then
  BUILDS_DIR="/home/parth/clubs/open-source/clad/${2}/builds"
else
  BUILDS_DIR=/home/parth/clubs/open-source/clad/fork/builds
fi

LLVM_DIR=/usr/lib/llvm-${1}
CLANG_DIR=/usr/lib/llvm-${1}
if [[ "$1" =~ "debug" ]]; then
  LLVM_DIR="/home/parth/clubs/open-source/LLVM/builds/build-${1}/inst/lib/cmake/llvm"
  CLANG_DIR="/home/parth/clubs/open-source/LLVM/builds/build-${1}/inst/lib/cmake/clang"
fi

mkdir -p ${BUILDS_DIR}/build-${1}
cd ${BUILDS_DIR}/build-${1}
mkdir -p obj inst
cd obj
rm -rf *
CC="clang-15" CXX="clang++-15" cmake -G Ninja ../../../clad -DClang_DIR=${CLANG_DIR} -DLLVM_DIR=${LLVM_DIR} -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=../inst -DLLVM_EXTERNAL_LIT="`which lit`" -DCMAKE_EXPORT_COMPILE_COMMANDS=On
ninja install