source 'https://rubygems.org'

# Install omnibus software
gem 'omnibus', github: 'opscode/omnibus'

# Use Chef's software definitions. It is recommended that you write your own
# software definitions, but you can clone/fork Chef's to get you started.
gem 'omnibus-software', github: 'opscode/omnibus-software'

group :development do
  # Use Berkshelf for resolving cookbook dependencies
  gem 'berkshelf', '~> 3.0'

  # Use Test Kitchen with Vagrant for converging the build environment
  gem 'test-kitchen',    '~> 1.2'
  gem 'kitchen-vagrant', '~> 0.14'
end
