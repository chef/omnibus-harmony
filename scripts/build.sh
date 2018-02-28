#!/usr/bin/env bash
set -e

export PROJECT_NAME=harmony
export OMNIBUS_CACHE_DIR=~/omnibus/cache

bundle install --without development --path vendor/bundle --retry 5

OMNIBUS_BUILD_OPTIONS="-l internal --populate-s3-cache --override s3_profile:omnibus-cache fatal_licensing_warnings:true cache_suffix:$PROJECT_NAME append_timestamp:false"

bundle exec omnibus build $PROJECT_NAME $OMNIBUS_BUILD_OPTIONS