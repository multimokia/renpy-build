#!/bin/bash

set -e

# Base dependencies
apt update

# install git and sudo
apt install -y git sudo

# Now begin workflow
git clone https://github.com/multimokia/renpy-build

cd renpy-build

# Temp until this goes into the master branch of this repo
git checkout docker-support

chmod +x ./prepare.sh
./prepare.sh

# Activate venv
. tmp/virtualenv.py3/bin/activate

# Build
python build.py

cp -r ./* /outdir