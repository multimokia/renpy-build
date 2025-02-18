#!/bin/bash

set -e

# Base dependencies
apt-get update

# install git and sudo
apt-get install -y git sudo

# Now begin workflow
git clone https://github.com/multimokia/renpy-build

# Move deps over
mv android-ndk-r27c-linux.zip renpy-build/tars/
mv CubismSdkForNative-4-r.6.2.zip renpy-build/tars/

cd renpy-build

# Temp until this goes into the master branch of this repo
git checkout docker-support

chmod +x ./prepare.sh
./prepare.sh

# Activate venv
. tmp/virtualenv.py3/bin/activate

# Build
python build.py

cp -r ./renpy/* /outdir