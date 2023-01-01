#!/usr/bin/env sh

rm -vrf ~/.config/nvim ~/.cache/nvim ~/.local/share/nvim
mkdir -p ~/.config/nvim
cp -vax init.lua lua ~/.config/nvim
nvim --headless -R +'sleep 120'
