#!/bin/bash

set -e

pushd ./dev/morpcc
git pull -r
popd

pushd ./dev/morpfw
git pull -r
popd

pushd ./dev/rulez
git pull -r
popd
