require_relative 'lib/omnibus-harmony/version'

Gem::Specification.new do |spec|
  spec.name          = "OmnibusHarmony-Test-Gem"
  spec.version       = OmnibusHarmony::VERSION
  spec.authors       = ["Sean Simmons"]
  spec.email         = ["ssimmons@progress.com"]

  spec.summary       = %q{This is a testing only local rubygem, used for testing summary}
  spec.description   = %q{This is a testing only local rubygem, used for testing description}
  spec.homepage      = "http://cheftestlocal.contoso.local"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "'http://cheftestlocal.contoso.local'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "http://cheftestlocal.contoso.local"
  spec.metadata["changelog_uri"] = "http://cheftestlocal.contoso.local/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
