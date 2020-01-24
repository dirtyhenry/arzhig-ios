#!/usr/bin/env bash -e

# Download the best MP4 video possible
youtube-dl \
  --format 'best' \
  --write-thumbnail \
  $1

