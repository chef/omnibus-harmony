#!/usr/bin/env bash

set -euo pipefail

#install rpmdevtools because we need rpmbuild command.
sudo yum update -y
sudo yum install -y rpmdevtools

tar_name=$(buildkite-agent meta-data get "PACKAGE_TAR_FILENAME")
echo "--- using PACKAGE_TAR_FILENAME=$tar_name from meta-data"

echo "--- setting env variables CHEF_INFRA_MIGRATE_TAR and CHEF_INFRA_HAB_TAR"
# export CHEF_INFRA_MIGRATE_TAR=https://github.com/chef/migration-tools/releases/latest/download/migration-tools_Linux_x86_64.tar.gz
# switch to github url once github access is fixed.
export CHEF_INFRA_MIGRATE_TAR=s3://chef-hab-migration-tool-bucket/rc2_hab_pkg_chef_client/rc2_migration_tool/migration-tools_Linux_x86_64.tar.gz
export CHEF_INFRA_HAB_TAR=$tar_name

echo "--- running build script"
./.expeditor/scripts/build-infra-rpm.sh

echo "--- uploading rpm package to artifactory and s3"
pkg_name=$(cat RPM_PKG_NAME)
buildkite-agent artifact upload $pkg_name
aws s3 cp $pkg_name s3://chef-hab-migration-tool-bucket/rc2_hab_pkg_chef_client/rc2_installer_folder/$pkg_name