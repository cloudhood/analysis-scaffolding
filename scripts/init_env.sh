#!/bin/bash
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - &&
apt-get update &&
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh &&
bash ~/miniconda.sh -b -p ~/miniconda &&
echo "PATH=$PATH:$HOME/miniconda/bin" >> .bashrc &&
source miniconda/bin/activate &&
pip install black isort pylint numpy scipy pandas statsmodels tensorflow scikit-learn &&
clear &&
python
