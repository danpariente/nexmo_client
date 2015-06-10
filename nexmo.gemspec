# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nexmo/version'

Gem::Specification.new do |spec|
  spec.name          = 'nexmo'
  spec.version       = Nexmo::VERSION
  spec.authors       = ['Dan Pariente']
  spec.email         = ['dan@apptegy.com']

  spec.summary       = %q{Nexmo's API ruby wrapper.}
  spec.description   = %q{Nexmo's API ruby wrapper.}
  spec.homepage      = 'https://github.com/apptegy/nexmo'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'vcr'

  spec.add_dependency 'activesupport', '> 3.0', '< 5.0.0'
  spec.add_dependency 'faraday'
  spec.add_dependency 'json'
  spec.add_dependency 'typhoeus'
end
