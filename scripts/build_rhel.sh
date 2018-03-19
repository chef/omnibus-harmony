#!/usr/bin/env bash
set -ex

# Build the project itself here
OMNIBUS_BUILD_OPTIONS="-l internal fatal_licensing_warnings:true cache_suffix:$PROJECT_NAME append_timestamp:false"
/home/omnibus/build_project.sh

# Upload the artifact to the buildkite job
# We make an arbitrarily named directory structure so we can grab the correct package
# in the test phase.
cd /home/omnibus/$PROJECT_NAME/pkg/
mkdir $PLATFORM_PACKAGE_KEY
mv *.rpm $PLATFORM_PACKAGE_KEY/
buildkite-agent artifact upload $PLATFORM_PACKAGE_KEY/*.rpm