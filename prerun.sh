#!/usr/bin/env bash

# This script will be executed ON THE HOST when you connect to the host.
# Put here your functions, environment variables, aliases and whatever you need.

#############################
# Example:
#export PATH=$CURR_DIR:$PATH
#############################

CURR_DIR="$(cd "$(dirname "$0")" && pwd)"
echo $CURR_DIR
CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
plugin_name='xxh-plugin-prerun-zsh-ranger'

export PATH=$CURR_DIR/build/ranger:$PATH
# export BAT_THEME="GitHub"
# alias cat='bat --paging=never'
# fpath=($CURR_DIR/bat/autocomplete $fpath)
