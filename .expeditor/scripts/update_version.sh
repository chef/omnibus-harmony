#!/bin/sh

############################################################################
# What is this script?
#
# Chef uses a workflow tool called Expeditor to manage version bumps, changelogs
# and releases. After a PR is merged in Chef Expeditor calls this script to update
# the PATCH version in the VERSION file as well as the version.rb file in both chef
# and chef-config. When that's done it bundle updates to pull in that new chef-config.
############################################################################

set -evx

VERSION=$(cat VERSION)
ORIGINAL_VERSION=$(git show main:VERSION)

sed -i -r "s/^(\s*)VERSION = \".+\"/\1VERSION = \"${VERSION}\"/" lib/omnibus-harmony/version.rb