# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'segv_silencer/version'

Gem::Specification.new do |spec|
  spec.name          = "segv_silencer"
  spec.version       = SegvSilencer::VERSION
  spec.authors       = ["Genki Takiuchi"]
  spec.email         = ["genki@s21g.com"]

  spec.summary       = ""
  spec.description   = ""
  spec.homepage      = "https://github.com/genki/segv_silencer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/segv_silencer/extconf.rb"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rake-compiler"
end
