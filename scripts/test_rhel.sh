#!/usr/bin/env bash
set -e

sudo buildkite-agent artifact download "*.$PLATFORM_PACKAGE_KEY.*.rpm" .

sudo rpm -i *.rpm

# Test the project itself here
bash -c /home/omnibus/test_project.sh