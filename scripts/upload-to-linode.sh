#!/usr/bin/env bash -e

# Upload to linode bucket:
# linode-cli obj put --acl-public FILENAME BUCKET_NAME

# Generate a unique signed download URL:
# linode-cli obj signurl BUCKET_NAME FILENAME +DURATION_IN_SECONDS

# Docs are available here: 
# https://www.linode.com/docs/platform/object-storage/how-to-use-object-storage/#linode-cli

linode-cli obj put --acl-public $VIDEO_FILENAME $BUCKET_NAME
