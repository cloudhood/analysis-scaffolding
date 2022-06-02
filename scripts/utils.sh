#!/bin/bash
function init_venv {
  conda deactivate  # activated by default in Sagemaker Studio Lab
  python3 -m venv $1
  echo "Appending path to venv to .bashrc..."
  echo "source $1/bin/activate" >> $HOME/.bashrc
  
  echo "Appending to .gitignore..."
  echo "source $1/bin/activate" >> .gitignore
  
  echo "Activating venv..."
  source $1/bin/activate
}

function install_pip {
  source $1/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
}
