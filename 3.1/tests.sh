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
  docker build --build-arg PHP7CC_VERSION_ARG=$1 -t ${IMAGE_NAME} .
  check_error $? $*
}

exec_installer() {
  echo "============== RUN TEST with params ${*}"
  $DOCKER_CMD $*
  check_error $? $*
}

test_all() {
  local version="${1:-1.2.1}"
  build_image $version
  exec_installer
  exec_installer php7cc -h
  exec_installer php7cc --version | grep "${version}"
}

test_all 1.1.0
test_all
