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
  # plugin_dir="$(cd "$(dirname "$0")" && pwd)"
  # echo "XXH_HOME is:" $XXH_HOME
  local xxh_plugins_dir="$HOME/.xxh/.xxh/plugins"
  local plugin_dir="$xxh_plugins_dir/$plugin_name"
  local build_dir=$plugin_dir/build
  echo "BUILD DIR IS:" $build_dir

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
  # rm -rfv $plugin_dir
  # Install ranger on the remote host
  if [ ! -d $plugin_dir ]; then
    git clone --depth 1 https://github.com/ranger/ranger.git $xxh_plugins_dir
  fi
  # mkdir -p $build_dir

  # cd $plugin_dir
  # cp *prerun.sh *pluginrc.* $build_dir/

  # for f in *pluginrc.*
  # do
  #     cp $plugin_dir/$f $build_dir/
  # done
  # for f in *prerun.sh
  # do
  #     cp $plugin_dir/$f $build_dir/
  # done

  # cd $build_dir

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
