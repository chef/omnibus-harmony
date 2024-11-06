#!/bin/bash

set -euox pipefail

files=($(ls *.tar.gz 2>/dev/null))
    for file in "${files[@]}"; do
        echo "$file"
    done