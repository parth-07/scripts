BUILDS_DIR=/home/parth/clubs/open-source/clad/fork/builds
build_root=${BUILDS_DIR}/build-${1}

if [ ! -d ${build_root}/obj ]
then
  echo "Build obj directory do not exists!"
  echo "Exiting now."
fi

cd ${build_root}/obj
lit test -v