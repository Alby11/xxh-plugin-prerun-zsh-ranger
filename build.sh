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
  CDIR="$(cd "$(dirname "$0")" && pwd)"
  build_dir=$CDIR/build

  while getopts A:K:q option
  do
    case "${option}"
    in
      q) QUIET=1;;
      A) ARCH=${OPTARG};;
      K) KERNEL=${OPTARG};;
    esac
  done

  rm -rf $build_dir
  mkdir -p $build_dir

  cd $CDIR
  # cp *prerun.sh *pluginrc.* $build_dir/
  cp *prerun.sh  $build_dir/

  cd $build_dir

  # Install ranger on the remote host
  if [ ! -d "${XXH_HOME}/.xxh/plugins/xxh-plugin-prerun-zsh-ranger/build/ranger" ]; then
    git clone --depth 1 https://github.com/ranger/ranger.git ${XXH_HOME}/.xxh/plugins/xxh-plugin-prerun-ranger/build/ranger
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
