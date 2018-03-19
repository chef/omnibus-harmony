#!/usr/bin/env bash
set -e

sudo buildkite-agent artifact download "*.deb" .

sudo apt-get install $PLATFORM_PACKAGE_KEY/*.deb -y

# Test the project itself here
bash -c /home/omnibus/test_project.sh