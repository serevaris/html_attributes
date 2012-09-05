# -*- encoding: utf-8 -*-
require File.expand_path("../lib/html_attributes/version", __FILE__)

Gem::Specification.new do |gem|

  gem.name          = "html_attributes"
  gem.authors       = ["Jan Sebastian Siwy", "Martin Spickermann", "Henning Staib"]
  gem.email         = ["github@henning-staib.de"]
  gem.summary       = %q{html_attributes provide helper methods to convert arrays
                          and hashes to valid html attributes.}
  gem.description   = %q{html_attributes provide helper methods to convert arrays
                          and hashes to valid html attributes.}
  gem.homepage      = "https://github.com/serevaris/html_attributes"

  gem.files         = `git ls-files`.split($\)
  gem.require_paths = ["lib"]
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.version       = HtmlAttributes::VERSION
  gem.platform      = Gem::Platform::RUBY

  gem.add_development_dependency "rspec"

end
