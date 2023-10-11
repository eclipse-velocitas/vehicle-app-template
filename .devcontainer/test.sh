#!/bin/bash

if [ ! -e "vehicle-app-python-sdk" ]; then
    git clone git@github.com:eclipse-velocitas/vehicle-app-python-sdk.git
fi

cd vehicle-app-python-sdk
git switch velocitas-create
git pull
export VELOCITAS_SDK_PATH_OVERRIDE=$(pwd)
cd ..

if [ ! -e "cli" ]; then
    git clone git@github.com:eclipse-velocitas/cli.git
fi

cd cli
git switch fix/create-command-adaptions
git pull
./install_node.sh

sudo apt-get update
sudo apt-get install -y make gcc g++
npm i
cd ..

echo "################################"
echo "#  Creating your Vehicle App   #"
echo "################################"
./cli/bin/dev create
