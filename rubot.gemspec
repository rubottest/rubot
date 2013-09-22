# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubot/version'

Gem::Specification.new do |spec|
  spec.name          = "rubot"
  spec.version       = Rubot::VERSION
  spec.authors       = ["Daniel Heath"]
  spec.email         = ["daniel@heath.cc"]
  spec.summary       = "Interpreter for toy robot control language"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "cane"
  spec.add_development_dependency "simplecov"
end
