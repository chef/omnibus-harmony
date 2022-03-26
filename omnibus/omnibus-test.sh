#!/bin/bash
set -ueo pipefail

echo "--- Checking Ruby"
/opt/harmony/embedded/bin/ruby --version | grep "ruby [0-9]\.[0-9]\.[0-9]"
