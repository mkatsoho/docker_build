#! /usr/bin/env bash

## vars
DockerName=evaluation
ScriptRunDocker=docker_load_and_run.sh
MainEntries="server"
# MainEntries="server client"


## tag and cwd
SOURCE=`pwd`
PROJ=`basename $SOURCE`
TAG=`date --iso-8601=s`
TAG=`echo $TAG | sed 's/:/./g' | sed 's/+/_/g' | sed 's/-/./g'`
TARGET=$SOURCE/../__build/${PROJ}

## build version
rm BUILD_*.tmp
touch BUILD_${TAG}.tmp


## make build folder
mkdir -p $TARGET
cp $ScriptRunDocker $TARGET
chmod 755 $TARGET/$ScriptRunDocker



for Main in ${MainEntries}; do
    echo
    echo ">>> building docker for ${Main} >>>"

    ## build docker image
    docker rmi -f ${DockerName}_${Main}:${TAG}
    docker build -t ${DockerName}_${Main}:${TAG} -f ${Main}.Dockerfile .
    docker save ${DockerName}_${Main}:${TAG} > ${TARGET}/${DockerName}-${Main}-${TAG}.tgz

    echo "CREATED DOCKER ${DockerName}_${Main}:${TAG}"
    echo "SAVED DOCKER as ${TARGET}/${DockerName}-${Main}-${TAG}.tgz"
done

exit 0

