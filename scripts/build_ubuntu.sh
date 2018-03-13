#!/usr/bin/env bash
set -e

# export PROJECT_NAME=harmony

bash -c /home/omnibus/build_project.sh

buildkite-agent artifact upload /home/omnibus/$PROJECT_NAME/pkg/*.deb