#!/bin/sh

if [ "$(which keyd)" ]; then
    echo "keyd is already installed"
    exit 0
fi

git clone https://github.com/rvaiya/keyd keyd_repo
cd keyd_repo || exit 1
git checkout v2.4.3
make && sudo make install
sudo systemctl enable keyd && sudo systemctl start keyd
cd .. || exit 1
rm -rf keyd_repo
