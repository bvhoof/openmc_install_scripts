#!/bin/bash
# set -ex

#default install location. may be overrridden by the option --prefix=<path>
LOCAL_INSTALL_PREFIX=/usr/local/lib

prefix_regex="^--prefix=(.*)$"
for arg in $*
do
  if [[ $arg =~ $prefix_regex ]]
  then
    echo ${BASH_REMATCH[0]}
    LOCAL_INSTALL_PREFIX=${BASH_REMATCH[1]}
  fi
done
export LOCAL_INSTALL_PREFIX

#default openmc build directory. may be overridden by the option --openmc_build=<path>
OPENMC_BUILD_PREFIX=$HOME/openmc

openmc_build_regex="^--openmc_build=(.*)$"
for arg in $*
do
  if [[ $arg =~ $openmc_build_regex ]]
  then
    echo ${BASH_REMATCH[0]}
    OPENMC_BUILD_PREFIX=${BASH_REMATCH[1]}
  fi
done
export OPENMC_BUILD_PREFIX

#openmc compile & install
#openmc-install.sh will call install scripts of its dependencies & nuclear data
./openmc-install.sh
echo "Compiled & installed openmc, done."
