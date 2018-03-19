#!/usr/bin/env bash
set -e

env
uname -a

buildkite-agent artifact download "*.el7.*.rpm" .

# Build the project itself here
bash -c /home/omnibus/test_project.sh