#!/usr/bin/env bash

main() {
  #############
  # <Example>
	need_cmd curl
	need_cmd grep
	need_cmd cut
	need_cmd xargs
	need_cmd chmod
  # </Example>
  #############
	build
}

build() {
  local plugin_name="xxh-plugin-prerun-zsh-ranger"
  # CDIR="$(cd "$(dirname "$0")" && pwd)"
  local plugin_dir="${XXH_HOME}/.xxh/plugins/"
  local CDIR="$plugin_dir/$plugin_name"
  local build_dir=$CDIR/build

  while getopts A:K:q option
  do
    case "${option}"
    in
      q) QUIET=1;;
      A) ARCH=${OPTARG};;
      K) KERNEL=${OPTARG};;
    esac
  done

  # rm -rf $build_dir
  rm -rf $CDIR
  mkdir -p $build_dir

  # cd $CDIR
  # cp *prerun.sh *pluginrc.* $build_dir/

  for f in *pluginrc.*
  do
      cp $CDIR/$f $build_dir/
  done
  for f in *prerun.sh
  do
      cp $CDIR/$f $build_dir/
  done

  # cd $build_dir

  # Install ranger on the remote host
  if [ ! -d $CDIR ]; then
    git clone --depth 1 https://github.com/ranger/ranger.git $plugin_dir
  fi
}

cmd_chk() {
  >&2 echo Check "$1"
	command -v "$1" >/dev/null 2>&1
}

need_cmd() {
  if ! cmd_chk "$1"; then
    error "need $1 (command not found)"
    exit 1
  fi
}

main "$@" || exit 1
