# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google/taxonomy/version'

Gem::Specification.new do |spec|
  spec.name          = "google-taxonomy"
  spec.version       = Google::Taxonomy::VERSION
  spec.authors       = ["Hendrik Kleinwaechter", "Christian Semmler", "Philipp Meissner"]
  spec.email         = ["hendrik.kleinwaechter@gmail.com"]
  spec.summary       = %q{Working with the google taxonomy}
  spec.description   = %q{Working with the google taxonomy}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 4.7"
  spec.add_development_dependency "webmock", "~> 1.0"
  spec.add_development_dependency "pry", '~> 0.9.12'

end
