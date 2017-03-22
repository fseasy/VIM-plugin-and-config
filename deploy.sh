#!/bin/sh

echo "extract plugin dir to $HOME/.vim " >/dev/stderr
tar xzf vim_plugin.tar.gz -C ~

if [ -e "$HOME/.vimrc" ]; then
    echo "back up previous .vimrc file to $HOME/.vimrc.backup.1" >/dev/stderr
    cp $HOME/.vimrc $HOME/.vimrc.backup.1
fi
echo "set .vimrc config file." >/dev/stderr
cp vimrc $HOME/.vimrc

echo "done" > /dev/stderr
