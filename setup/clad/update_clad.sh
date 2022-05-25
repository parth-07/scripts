BUILDS_DIR=/home/parth/clubs/open-source/clad/fork/builds
build_root=${BUILDS_DIR}/build-${1}

if [ ! -d ${build_root} ]
then 
  echo "Build root do not exist!"
  echo "Configuring and building Clad."
  build_clad.sh ${1}
else
  echo "Updating Clad."
  cd ${build_root}/obj
  ninja install
fi