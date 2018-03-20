#!/usr/bin/env bash
set -e

# Build the project itself here
export OMNIBUS_BUILD_OPTIONS="-l internal --override cache_suffix:$PROJECT_NAME fatal_licensing_warnings:true append_timestamp:false"
/home/omnibus/build_project.sh

# Upload the artifact to the buildkite job
# We make an arbitrarily named directory structure so we can grab the correct package
# in the test phase.
cd /home/omnibus/$PROJECT_NAME/pkg/
mkdir -p  $PROJECT_NAME/$PLATFORM_PACKAGE_KEY
mv *.rpm $PROJECT_NAME/$PLATFORM_PACKAGE_KEY/
buildkite-agent artifact upload $PROJECT_NAME/$PLATFORM_PACKAGE_KEY/*.rpm