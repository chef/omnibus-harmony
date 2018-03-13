#!/usr/bin/env bash
set -e

# Build the project itself here
bash -c /home/omnibus/build_project.sh

# Upload the artifact to the buildkite job
buildkite-agent artifact upload /home/omnibus/$PROJECT_NAME/pkg/*.deb