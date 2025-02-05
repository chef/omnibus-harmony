#!/usr/bin/env bash
echo "-- debug" 
set -euo pipefail

tar_name=$(buildkite-agent meta-data get "PACKAGE_TAR_FILENAME")
echo "--- using PACKAGE_TAR_FILENAME=$tar_name from meta-data"

echo "--- setting env variables CHEF_INFRA_MIGRATE_TAR and CHEF_INFRA_HAB_TAR"
export CHEF_INFRA_MIGRATE_TAR='migration-tools_Linux_x86_64.tar.gz'
export CHEF_INFRA_HAB_TAR=$tar_name

echo "--- running build script"
./.expeditor/scripts/build-infra-deb.sh

echo "--- uploading deb package to artifactory and s3"
pkg_name=$(cat DEB_PKG_NAME)
buildkite-agent artifact upload $pkg_name
aws s3 cp $pkg_name s3://chef-hab-migration-tool-bucket/rc2_hab_pkg_chef_client/rc2_installer_folder/$pkg_name