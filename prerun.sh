#!/usr/bin/env bash

# This script will be executed ON THE HOST when you connect to the host.
# Put here your functions, environment variables, aliases and whatever you need.

#############################
# Example:
#export PATH=$CURR_DIR:$PATH
#############################

plugin_name='xxh-plugin-prerun-zsh-ranger'

# CURR_DIR="$(cd "$(dirname "$0")" && pwd)"
# CURR_DIR is plugin build dir
CURR_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

export PATH=$CURR_DIR/ranger:$PATH
# export BAT_THEME="GitHub"
# alias cat='bat --paging=never'
# fpath=($CURR_DIR/bat/autocomplete $fpath)
