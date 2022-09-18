#!/bin/bash

# Live container build and reload
#
# - fswatch is a dependency (https://emcrisostomo.github.io/fswatch/getting.html)
# e.g. brew install fswatch

# watch for changes on the current folder or subdirectories

fswatch -oxr `pwd` | xargs -n1 -I{} ./docker_rebuild.sh