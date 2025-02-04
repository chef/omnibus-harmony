#!/usr/bin/env bash

set -euo pipefail

echo "--- hab export tar chef/chef-infra-client"
hab pkg export tar chef/chef-infra-client --channel unstable

echo "--- upload tar to artifactory and s3"
tar_name=$(find . -regex "./chef-chef-infra-client-[0-9]+\.[0-9]+\.[0-9]+-[0-9]+\.tar\.gz" -type f -exec basename {} \;) # tar name. pass this to next steps? 
mkdir -p upload && cp $tar_name upload/

cd upload/
buildkite-agent artifact upload $tar_name
aws s3 cp $tar_name s3://chef-hab-migration-tool-bucket/rc2_hab_pkg_chef_client/rc2_tar_folder/$tar_name

echo "--- update meta-data PACKAGE_TAR_FILENAME to $tar_name"
buildkite-agent meta-data set "PACKAGE_TAR_FILENAME" $tar_name
