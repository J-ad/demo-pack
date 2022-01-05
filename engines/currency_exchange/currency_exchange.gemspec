require_relative "lib/currency_exchange/version"

Gem::Specification.new do |spec|
  spec.name        = "currency_exchange"
  spec.version     = CurrencyExchange::VERSION
  spec.authors     = "Jan Adamski"
  spec.email       = "jan.adamski@gmail.com"
  spec.homepage    = "https://test.com"
  spec.summary     = "Summary of CurrencyExchange."
  spec.description = "Description of CurrencyExchange."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.1.4", ">= 6.1.4.4"
  spec.add_dependency "pg", "~> 1.2.3"
  spec.add_dependency "bcrypt", "3.1.13"

  spec.add_development_dependency "pg"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "pry"
end
