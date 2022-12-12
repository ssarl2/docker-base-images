#!/bin/bash

SCRIPT_DIR=$( dirname -- "$( readlink -f -- "$0"; )"; )
cd $SCRIPT_DIR

cd utils
bash docker_run.sh &

sudo echo "Running docker env"

sleep 1
for i in {3..1}
do
    echo $i
    sleep 1
done

bash docker_exec.sh

docker stop docker_ide
