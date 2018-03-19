#!/usr/bin/env bash
set -e

env

buildkit-agent artifact download "pkg/*.el7.rpm"

# Build the project itself here
bash -c "$VERIFY_COMMAND"

# # Upload the artifact to the buildkite job
# buildkite-agent artifact upload /home/omnibus/$PROJECT_NAME/pkg/*.rpm