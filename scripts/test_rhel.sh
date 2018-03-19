#!/usr/bin/env bash
set -e

sudo buildkite-agent artifact download "*.el7.*.rpm" .
ls -la /opt/

sudo rpm -i *.rpm

# Build the project itself here
bash -c /home/omnibus/test_project.sh

ls -la /home/omnibus