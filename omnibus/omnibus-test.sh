#!/bin/bash
set -ueo pipefail

channel="${CHANNEL:-unstable}"
product="${PRODUCT:-harmony}"
version="${VERSION:-latest}"
package_file=${PACKAGE_FILE:-""}

echo "--- Installing $channel $product $version"
if [[ -z $package_file ]]; then
  package_file="$(/opt/omnibus-toolchain/bin/install-omnibus-product -c "$channel" -P "$product" -v "$version" | tail -n 1)"
fi

echo "--- Verifying omnibus package is signed"
/opt/omnibus-toolchain/bin/check-omnibus-package-signed "$package_file"

echo "--- Testing $channel $product $version"
/opt/harmony/embedded/bin/openssl version | grep "OpenSSL [0-9]\.[0-9]\.[0-9][a-z]"
