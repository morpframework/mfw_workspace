#!/bin/bash

set -e

if [ ! -d "./venv" ];then
    echo "Initializing Virtualenv"
    virtualenv -p python3 venv
fi

if [ ! -f "./bin/buildout" ];then
    echo "Bootstrap Buildout"
    ./venv/bin/pip install zc.buildout
    ./venv/bin/buildout bootstrap
fi

echo "Starting Build ..."

./bin/buildout -vvv $@

echo "Downloading Resources .."

./bin/python dev/morpcc/download-resources.py

echo "Build Complete!"
