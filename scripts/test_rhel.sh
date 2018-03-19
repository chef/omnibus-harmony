#!/usr/bin/env bash
set -e

id

buildkite-agent artifact download "*.el7.*.rpm" tmp/

# Build the project itself here
bash -c /home/omnibus/test_project.sh

ls -la /home/omnibus