#!/usr/bin/env bash
set -x

CURRENT_PATH=`pwd`

for f in */
do
  echo "Running tests in ${f} directory..."
  cd "${CURRENT_PATH}/${f}" && ./tests.sh
done


