name 'harmony'
maintainer 'Chef Software'
homepage 'https://getchef.com'

install_dir     '/opt/harmony'
build_version   Omnibus::BuildVersion.semver
build_iteration 1

# creates required build directories
dependency 'preparation'

# harmony dependencies/components
if windows?
  # nothing right now
else
  dependency 'rsync'
end

# version manifest file
dependency 'version-manifest'

exclude '\.git*'
exclude 'bundler\/git'
exclude 'man\/'
