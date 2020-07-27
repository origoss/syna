#!/bin/sh

IMAGE=node:10
dir=$(realpath $(dirname "$0"))
uid=$(id -u)
gid=$(id -g)
cat > /tmp/yarnrc <<EOF
--cache-folder /tmp/yarn/cache/
EOF

docker run --rm -ti -v "${dir}:/theme" -v "/tmp/yarnrc:/.yarnrc" --tmpfs /tmp --tmpfs /.yarn -u "${uid}:${gid}" --entrypoint bash "${IMAGE}" -c "cd /theme; make dep"
