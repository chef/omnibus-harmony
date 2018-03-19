#!/usr/bin/env bash
set -e

sudo buildkite-agent artifact download "*.el7.*.rpm" .
ls -la /opt/
ls -la home/omnibus/harmony/pkg/

sudo rpm -i home/omnibus/harmony/pkg/*.rpm

# Build the project itself here
bash -c /home/omnibus/test_project.sh

ls -la /home/omnibus