#!/usr/bin/env bash
set -e

id
ls -la .
ls -la /tmp/
ls -la tmp/

buildkite-agent artifact download "*.el7.*.rpm" tmp/

# Build the project itself here
bash -c /home/omnibus/test_project.sh

ls -la /home/omnibus