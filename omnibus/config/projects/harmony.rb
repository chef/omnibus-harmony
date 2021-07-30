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
#dependency "libxml2"
#dependency "libxslt"
#dependency "libiconv"
#dependency "liblzma"
#dependency "zlib"
#dependency 'openssl'

#unless windows?
  # builds the 'discord' dummy project
  # see the discord software def. for more details
#  dependency 'discord'
#end
override :expat, version: "2.4.0"

# 1.1.1i+ builds on m1 and we don't reasonably expect 1.0.2
# to be made buildable on m1.
override :openssl, version: "1.1.1i" if mac_os_x?

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
  signing_identity "AF21BA8C9E50AE20DA9907B6E2D4B0CC3306CA03", machine_store: true
  parameters ProjectLocationDir: project_location_dir
end
