name 'harmony'
maintainer "Chef Software Inc"
homepage   "https://www.chef.io"
license "Apache-2.0"
license_file "../LICENSE"

install_dir "#{default_root}/#{name}"

build_version   Omnibus::BuildVersion.semver
build_iteration 1

# creates required build directories
dependency 'preparation'

# harmony dependencies/components
dependency "libxml2"
dependency "libxslt"
dependency "libiconv"
dependency "liblzma"
dependency "zlib"
dependency 'openssl'

unless windows?
  # builds the 'discord' dummy project
  # see the discord software def. for more details
  dependency 'discord'
end

# 1.1.1i+ builds on m1 and we don't reasonably expect 1.0.2
# to be made buildable on m1.
override :openssl, version: "1.1.1m" if mac_os_x?

# libxslt 1.1.35 does not build successfully with libxml2 2.9.13 on Windows so we will pin
# windows builds to libxslt 1.1.34 and libxml2 2.9.10 for now and followup later with the
# work to fix that issue in IPACK-145.
override "libxml2", version: "2.9.10" if windows?
override "libxslt", version: "1.1.34" if windows?

exclude '\.git*'
exclude 'bundler\/git'
exclude 'man\/'

package :rpm do
  signing_passphrase ENV["OMNIBUS_RPM_SIGNING_PASSPHRASE"]
end

package :pkg do
  identifier 'com.getchef.harmony'
  signing_identity 'Chef Software, Inc. (EU3VF8YLX2)'
end
compress :dmg

project_location_dir = name
package :msi do
  fast_msi true
  upgrade_code "3AA89B1F-D8F3-4D46-8CB2-534C8313DBFD"
  signing_identity "7D16AE73AB249D473362E9332D029089DBBB89B2", machine_store: true
  parameters ProjectLocationDir: project_location_dir
end
