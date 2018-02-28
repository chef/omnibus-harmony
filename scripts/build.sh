#!/usr/bin/env bash
set -e

export PROJECT_NAME=harmony

sudo rm -rf /opt/$PROJECT_NAME
sudo mkdir /opt/$PROJECT_NAME
sudo chown build:staff /opt/$PROJECT_NAME
sudo mkdir -p /var/cache/omnibus
sudo chmod 777 /var/cache/omnibus

bundle install --without development --path vendor/bundle --retry 5

OMNIBUS_BUILD_OPTIONS="-l internal --populate-s3-cache --override s3_profile:omnibus-cache fatal_licensing_warnings:true cache_suffix:$PROJECT_NAME append_timestamp:false"

bundle exec omnibus build $PROJECT_NAME $OMNIBUS_BUILD_OPTIONS