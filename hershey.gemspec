# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hershey/version'

Gem::Specification.new do |spec|
  spec.name          = "hershey"
  spec.version       = Hershey::VERSION
  spec.authors       = ["Winston Durand"]
  spec.email         = ["me@winstondurand.com"]
  spec.summary       = %q{Generates an SVG with text using the Hershey Vector Font}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/R167/hershey"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", '~> 3.1'

  spec.required_ruby_version = '>= 2.0.0'
end
