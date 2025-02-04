#!/usr/bin/env bash

set -euo pipefail

echo "fetching latest release info"
curl -fSL -H "Authorization: Bearer $GITHUB_TOKEN" https://api.github.com/repos/chef/migration-tools/releases/latest -o migration-tool-latest-release.json
latest_version=$(cat migration-tool-latest-release.json | jq -r '.tag_name')

echo "requesting migration-tools_Linux_x86_64.tar.gz from $latest_version release"
cat migration-tool-latest-release.json \
    | jq '.assets[] | select (.name == "migration-tools_Linux_x86_64.tar.gz") | .url' \
    | xargs curl -fSL -H "Authorization: Bearer $GITHUB_TOKEN" -H "Accept: application/octet-stream" -o "migration-tools_Linux_x86_64.tar.gz"

file migration-tools_Linux_x86_64.tar.gz

# curl -fSL -H "Authorization: Bearer $GITHUB_TOKEN" -H "Accept: application/octet-stream" https://api.github.com/repos/chef/migration-tools/releases/assets/217686273 -o migration-tools_Linux_x86_64.tar.gz

# echo "--- hab export tar chef/chef-infra-client"
# hab pkg export tar chef/chef-infra-client --channel unstable

# echo "--- upload tar to artifactory and s3"
# tar_name=$(find . -regex "./chef-chef-infra-client-[0-9]+\.[0-9]+\.[0-9]+-[0-9]+\.tar\.gz" -type f -exec basename {} \;) # tar name. pass this to next steps? 
# mkdir -p upload && cp $tar_name upload/

# cd upload/
# buildkite-agent artifact upload $tar_name
# aws s3 cp $tar_name s3://chef-hab-migration-tool-bucket/rc2_hab_pkg_chef_client/rc2_tar_folder/$tar_name

# echo "--- update meta-data PACKAGE_TAR_FILENAME to $tar_name"
# buildkite-agent meta-data set "PACKAGE_TAR_FILENAME" $tar_name
