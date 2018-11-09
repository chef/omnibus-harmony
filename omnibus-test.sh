#!/bin/bash
set -ueo pipefail

channel="${CHANNEL:-unstable}"
product="${PRODUCT:-harmony}"
version="${VERSION:-latest}"

echo "--- Installing $channel $product $version"
package_file="$(install-omnibus-product -c "$channel" -P "$product" -v "$version" | tail -n 1)"

if [[ "$package_file" == *.rpm ]]; then
  check-rpm-signed "$package_file"
fi

echo "--- Testing $channel $product $version"
/opt/harmony/embedded/bin/openssl version | grep "OpenSSL [0-9]\.[0-9]\.[0-9][a-z]"
