# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'table_beet/version'

Gem::Specification.new do |gem|
  gem.name          = 'table_beet'
  gem.version       = TableBeet::VERSION
  gem.authors       = ['Tadashi Nemoto']
  gem.email         = ['tadashi.nemoto0713@gmail.com']
  gem.description   = 'Reference generator for Turnip steps of exists'
  gem.summary       = 'Reference generator for Turnip steps of exists'
  gem.homepage      = 'https://github.com/tadashi0713/table_beet'

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_dependency 'method_source'
  gem.add_dependency 'slop'
  gem.add_dependency 'turnip', '>= 3.0.0'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'coveralls'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rubocop'
end
