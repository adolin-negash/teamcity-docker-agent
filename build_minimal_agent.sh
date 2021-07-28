#!/bin/bash

TMP_DIR='.tmp'
jdkLinuxComponent='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.11%2B9/OpenJDK11U-jdk_x64_linux_hotspot_11.0.11_9.tar.gz'
jdkLinuxComponentSha256SUM='e99b98f851541202ab64401594901e583b764e368814320eba442095251e78cb'
IMAGE='zf/teamcity-minimal-custom-agent:1.0.1'

if [[ ! -d $TMP_DIR ]]
then
  mkdir $TMP_DIR;
  # download teamcity
  wget -c https://download.jetbrains.com/teamcity/TeamCity-2020.2.3.tar.gz -O - | tar -xz -C $TMP_DIR;
fi

cp scripts/* $TMP_DIR

echo "jdkLinuxComponent: $jdkLinuxComponent";
echo "jdkLinuxComponentSha256SUM: $jdkLinuxComponentSha256SUM";

docker rmi $IMAGE

echo "Build image"
docker build -t $IMAGE \
  --build-arg jdkLinuxComponent=$jdkLinuxComponent \
  --build-arg jdkLinuxComponentSha256SUM=$jdkLinuxComponentSha256SUM \
  -f Minimal.Dockerfile \
  --no-cache $TMP_DIR