name 'harmony'
maintainer 'Chef Software'
homepage 'https://getchef.com'

install_dir "#{default_root}/#{name}"

build_version   Omnibus::BuildVersion.semver
build_iteration 1

# creates required build directories
dependency 'preparation'

# harmony dependencies/components
if windows?
  dependency 'libyaml-windows'
else
  # builds the 'discord' dummy project
  # see the discord software def. for more details
  dependency 'discord'
  dependency 'rsync'
end

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
exclude 'man\/'

package :pkg do
  identifier 'com.getchef.harmony'
end

package :msi do
  upgrade_code '3AA89B1F-D8F3-4D46-8CB2-534C8313DBFD'
  signing_identity '15abefe384ee2c829ea11f4e11da29e5b9595d53', machine_store: true
end
