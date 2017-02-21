#!/usr/bin/env bash

IMAGE_NAME="ypereirareis/php7cc"
DOCKER_CMD="docker run -it --rm -v $(pwd):/app ${IMAGE_NAME}"

check_error() {
  if [ "0" != "$1" ]; then
    shift
    echo "#### ERROR - Params: ${*}"
    exit 100
  fi
}

build_image() {
  echo "============== DOCKER BUILD IMAGE"
  docker build -t ${IMAGE_NAME} .
  check_error $? $*
}

exec_installer() {
  echo "============== RUN TEST with params ${*}"
  $DOCKER_CMD $*
  check_error $? $*
  
}

test_all() {
  build_image
  exec_installer
  exec_installer php7cc -h
}

test_all
