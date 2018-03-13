#!/usr/bin/env bash
set -e

# export PROJECT_NAME=harmony

bash -c /home/omnibus/build_project.sh

ls -la /home/omnibus/$PROJECT_NAME/pkg
# apt-get update -y
# apt-get install -y autoconf binutils-doc bison build-essential flex gettext ncurses-dev sudo

# curl -L https://omnitruck.chef.io/install.sh | sudo bash -s -- -P omnibus-toolchain

# groupadd admin
# useradd -d /home/omnibus -U -s /bin/bash -m omnibus
# echo "omnibus ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/omnibus
# chmod 0440 /etc/sudoers.d/omnibus

# rm -rf /opt/$PROJECT_NAME
# mkdir /opt/$PROJECT_NAME
# chown omnibus:admin /opt/$PROJECT_NAME
# mkdir -p /var/cache/omnibus
# chmod 777 /var/cache/omnibus

# sudo su - omnibus

# bundle install --without development --path vendor/bundle --retry 5

# OMNIBUS_BUILD_OPTIONS="-l internal --populate-s3-cache --override s3_profile:omnibus-cache fatal_licensing_warnings:true cache_suffix:$PROJECT_NAME append_timestamp:false"

# bundle exec omnibus build $PROJECT_NAME $OMNIBUS_BUILD_OPTIONS