#!/bin/bash

#
# The following standard Expeditor artifact_actions environment variables
# are automatically set by the calling process:
#
# PROMOTABLE - in promotion artifact actions this is a reference to the
#              source channel.
# TARGET_CHANNEL - the channel which we are promoting to
# HAB_AUTH_TOKEN - GitHub Auth token used to communicate with the
#                  Habitat depot and private repos in Chef's GitHub org
#
set -eoux pipefail

printenv

# Export the HAB_AUTH_TOKEN for use of promoting habitat packages to {{TARGET_CHANNEL}}
HAB_AUTH_TOKEN=$(vault kv get -field auth_token account/static/habitat/chef-ci)
export HAB_AUTH_TOKEN

if [ "${EXPEDITOR_TARGET_CHANNEL}" = "unstable" ];
then
  echo "This file does not support actions for artifacts promoted to unstable"
  exit 1
fi


# Promote the artifacts in Habitat Depot
jq -r -c ".packages[]" manifest.json | while read -r service_ident; do
  pkg_origin=${service_ident%/*/*/*}

  if [ "$pkg_origin" = "core" ];
  then
    echo "Skipping promotion of core origin package ${service_ident}"
  else
    echo "Promoting ${service_ident} to the ${EXPEDITOR_TARGET_CHANNEL} channel"
    hab pkg promote "${service_ident}" "${EXPEDITOR_TARGET_CHANNEL}"
  fi
done
