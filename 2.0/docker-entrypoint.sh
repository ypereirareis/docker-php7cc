#!/bin/bash
set -e

if [ "$1" == "php7cc" ]; then
    exec php -d memory_limit=2G /root/.composer/vendor/bin/"$@"
fi

exec "$@"


