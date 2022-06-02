#!/bin/bash
function append_bashrc {
  tee -a $HOME/.profile <<EOF  
    if [ -n "$BASH_VERSION" ]; then
      if [ -f "$HOME/.bashrc" ]; then
          . "$HOME/.bashrc"
      fi
    fi
}

function init_venv {
  python3 -m venv $1
  echo "Appending path to venv to .bashrc..."
  source $1/bin/activate" >> $HOME/.bashrc
}

function install_pip {
  source $1/bin/activate
  pip install --upgrade pip
  pip install -r requirements.txt
}
