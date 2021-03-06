require_relative 'lib/edm_festivals/version'

Gem::Specification.new do |spec|
  spec.name          = "edm_festivals"
  spec.version       = EdmFestivals::VERSION
  spec.authors       = ["alantang1369"]
  spec.email         = ["giabao_tang@yahoo.com"]

  spec.summary       = "This app is used to get info of the top 100 edm festivals around the world."
  spec.description   = "first project, cli"
  spec.homepage      = "https://github.com/alantang1369/edm-festivals-cli-gem"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = 'http://mygemserver.com'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alantang1369/edm-festivals-cli-gem"
  spec.metadata["changelog_uri"] = "https://github.com/alantang1369/edm-festivals-cli-gem"
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_development_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry"
end
