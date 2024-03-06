#!/bin/sh

case "$1" in
  bash)
    shift
    exec /bin/bash "$@"
    ;;
  sh)
    shift
    exec /bin/sh "$@"
    ;;
  *)
    exec pgcli "$@"
    ;;
esac
