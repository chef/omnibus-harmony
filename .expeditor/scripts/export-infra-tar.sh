#!/usr/bin/env bash

set -euo pipefail

echo "--- testing hab export tar chef/chef-infra-client"
hab pkg export tar chef/chef-infra-client --channel unstable
tar_name=$(find . -regex "./chef-chef-infra-client-[0-9]+\.[0-9]+\.[0-9]+-[0-9]+\.tar\.gz" -type f -exec basename {} \;) # tar name. pass this to next steps? 
# export PACKAGE_TAR_FILENAME=$(find . -regex "./chef-chef-infra-client-[0-9]+\.[0-9]+\.[0-9]+-[0-9]+\.tar\.gz" -type f -exec basename {} \;)
mkdir -p upload && cp $tar_name upload/
# mkdir -p upload && cp $file_path upload/
# cd upload/ && 
buildkite-agent artifact upload $tar_name
aws s3 cp $tar_name s3://rc2-hab-pkg-chef-client/rc2_tar/$tar_name
# export PACKAGE_TAR_FILENAME=$(find . -regex "./chef-chef-infra-client-[0-9]+\.[0-9]+\.[0-9]+-[0-9]+\.tar\.gz" -type f -exec basename {} \;)
# buildkite-agent env set PACKAGE_TAR_FILENAME=$(find . -regex "./chef-chef-infra-client-[0-9]+\.[0-9]+\.[0-9]+-[0-9]+\.tar\.gz" -type f -exec basename {} \;)
echo "setting PACKAGE_TAR_FILENAME to $tar_name"
buildkite-agent meta-data set "PACKAGE_TAR_FILENAME" $tar_name
# cd upload/ && buildkite-agent artifact upload "*.tar.gz" && aws s3 sync . s3://rc2-hab-pkg-chef-client/rc2_tar/ --exclude "*" --include "*.tar.gz" --region us-west-2 --profile chef-cd
