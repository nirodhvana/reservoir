#!/bin/bash
cd $HOME/reservoir && [[ "$(pwd)" == "$HOME/reservoir" ]] && stow --dotfiles -S . && notify-send --urgency=critical "DOTFILES SYNCED with HOME"
cd - && echo "dotfiles synced"
