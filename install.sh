#!/usr/bin/env sh

rm -vrf ~/.config/nvim ~/.cache/nvim ~/.local/share/nvim
mkdir -p ~/.config/nvim
cp -vax init.lua lua after ~/.config/nvim
nvim --headless -R +'sleep 120'
