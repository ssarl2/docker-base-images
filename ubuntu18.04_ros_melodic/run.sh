#!/bin/bash

cd utils
bash docker_run.sh &
sleep 4
bash docker_exec.sh

docker stop ub18_melodic
