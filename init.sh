#!/bin/sh

if [ ! -z "$PUID" -a ! -z "$PGID" ]; then
  shell="$(which bash || which sh)"
  addgroup --gid "$PGID" d_user
  adduser --home /home/d_user --shell "$shell" --gid "$PGID" --disabled-password --uid "$PUID" d_user
  chown -R "$PUID":"$PGID" /home/d_user
  chown -R "$PUID":"$PGID" /mnt/sync
fi

su - d_user -c "$@"
