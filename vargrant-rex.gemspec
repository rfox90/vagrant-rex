# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant-rex/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-rex"
  spec.version       = VagrantPlugins::Rex::VERSION
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Richard Fox"]
  spec.email         = ["info@ahref.co.uk"]
  spec.homepage      = "http://ahref.co.uk"
  spec.description   = "Enables Vagrant to provision with Rex."
  spec.summary       = "Enables Vagrant to provision with Rex."
  spec.license       = "GPL"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport', '!= 3.2.13'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
