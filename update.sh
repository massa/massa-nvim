#!/usr/bin/env sh

rsync -avz --progress -h ~/.config/nvim/init.lua ~/.config/nvim/lua ~/.config/nvim/after .
git add .
git status
