#!/usr/bin/env bash -e

youtube-dl \
  --format 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best' \
  --write-thumbnail \
  $1