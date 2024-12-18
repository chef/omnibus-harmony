#!/bin/bash

export_format=$(plugin_read_config FORMAT)

if [[ "${export_format:-}" = "docker" ]]; then
    # shellcheck source=../lib/export_docker.sh
    . "$DIR/../lib/export_docker.sh"
elif [[ "${export_format:-}" = "tar" ]]; then
    # shellcheck source=../lib/export_tarball.sh
    . "$DIR/../lib/export_tarball.sh"
else
    echo "Unsupported export format: ${export_format:-}. It should be docker or tar. Exiting."
    exit 1
fi
