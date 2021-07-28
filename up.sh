#!/bin/bash

export TC_ROOT=/media/adolin/data1/Work/data/teamcity

mkdir -p "${TC_ROOT}/data"
mkdir -p "${TC_ROOT}/logs"
mkdir -p "${TC_ROOT}/agent/m2"
mkdir -p "${TC_ROOT}/buildagent/work"
mkdir -p "${TC_ROOT}/buildagent/temp"
mkdir -p "${TC_ROOT}/buildagent/tools"
mkdir -p "${TC_ROOT}/buildagent/plugins"
mkdir -p "${TC_ROOT}/buildagent/system"
mkdir -p "${TC_ROOT}/buildagent/logs"

docker-compose up
docker-compose down
docker system prune -f