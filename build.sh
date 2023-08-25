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
  local CDIR="$(cd "$(dirname "$0")" && pwd)"
  echo "CDIR IS:" $CDIR
  # local plugin_name="xxh-plugin-prerun-zsh-ranger"
  # local xxh_plugins_dir="$HOME/.xxh/.xxh/plugins"
  # local plugin_dir="$xxh_plugins_dir/$plugin_name"
  local build_dir=$CDIR/build
  echo "BUILD DIR IS:" $build_dir

  rm -rf $build_dir
  mkdir -p $build_dir
  ls -la
  for f in $CDIR/*pluginrc.*
  do
      cp $CDIR/$f $build_dir/
  done
  for f in $CDIR/*prerun.sh
  do
      cp $CDIR/$f $build_dir/
  done
  
  cd $build_dir


  # while getopts A:K:q option
  # do
  #   case "${option}"
  #   in
  #     q) QUIET=1;;
  #     A) ARCH=${OPTARG};;
  #     K) KERNEL=${OPTARG};;
  #   esac
  # done

  # Install ranger on the remote host
  if [ ! -d $build_dir/ranger ]; then
    git clone --depth 1 https://github.com/ranger/ranger.git $build_dir/ranger
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
