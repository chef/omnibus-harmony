#!/usr/bin/env bash
set -ex

# Build the project itself here
bash -c /home/omnibus/build_project.sh

# Upload the artifact to the buildkite job
# We cd to the directory so we only get the package and not the dir structure
cd /home/omnibus/$PROJECT_NAME/pkg/
buildkite-agent artifact upload *.rpm