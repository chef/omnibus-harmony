#!/bin/bash
# Export the HAB_AUTH_TOKEN for use of promoting habitat packages to {{TARGET_CHANNE}}



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


set -eou pipefail

if [ "${EXPEDITOR_TARGET_CHANNEL}" = "unstable" ];
then
  echo "This file does not support actions for artifacts promoted to unstable"
  exit 1
fi

HAB_AUTH_TOKEN=$(vault kv get -field auth_token account/static/habitat/chef-ci)
export HAB_AUTH_TOKEN