#!/usr/bin/env bash
set -e

sudo buildkite-agent artifact download "$PROJECT_NAME/$PLATFORM_PACKAGE_KEY/*.deb" .

sudo dpkg -i $PROJECT_NAME/$PLATFORM_PACKAGE_KEY/*.deb

# Test the project itself here
bash -c /home/omnibus/test_project.sh