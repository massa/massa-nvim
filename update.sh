#!/usr/bin/env sh

rsync -avz --progress -h ~/.config/nvim/init.lua ~/.config/nvim/lua .
git add .
git status
