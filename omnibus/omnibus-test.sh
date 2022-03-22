#!/bin/bash
set -ueo pipefail

echo "--- Checking OpenSSL"
/opt/harmony/embedded/bin/openssl version | grep "OpenSSL [0-9]\.[0-9]\.[0-9]"
