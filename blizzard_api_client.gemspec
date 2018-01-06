require File.expand_path("../lib/blizzard_api_client/version", __FILE__)

Gem::Specification.new do |spec|
  spec.name           = "blizzard-api-client"
  spec.version        = BlizzardApiClient::VERSION
  spec.authors        = ["Casper Christensen"]
  spec.email          = ["cch@ccapps.dk"]
  spec.homepage       = "https://ccapps.dk"

  spec.summary        = "Blizzard API client for easy access to Blizzard API"
  spec.description    = "Blizzard API client for easy access to Blizzard API"
  spec.license        = 'Nonstandard'

  spec.required_rubygems_version  = ">= 2.5.0"
  spec.required_ruby_version      = '>= 2.3.0'
  spec.rubyforge_project          = "rki-client"

  # If you have other dependencies, add them here
  # spec.add_dependency "another", "~> 1.2"

  # If you need to check in files that aren't .rb files, add them here
  spec.files        = Dir["{lib}/**/*.rb", "LICENSE", "*.md"]
  spec.require_path = 'lib'

  spec.test_files   = Dir.glob('spec/**/*')

  # If you need an executable, add it here
  # spec.executables = ["newgem"]

  # If you have C extensions, uncomment this line
  # spec.extensions = "ext/extconf.rb

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
