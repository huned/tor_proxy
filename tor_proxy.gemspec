# -*- encoding: utf-8 -*-
require File.expand_path('../lib/tor_proxy/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Huned Botee"]
  gem.email         = ["huned@734m.com"]
  gem.summary       = %q{The simple way to HTTP GET over Tor with ruby.}
  gem.description   = %q{The simple way to HTTP GET over Tor with ruby.}
  gem.homepage      = "http://github.com/huned/tor_proxy"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "tor_proxy"
  gem.require_paths = ["lib"]
  gem.version       = Tor::Proxy::VERSION

  gem.add_dependency             'socksify'
  gem.add_dependency             'tor'

  gem.add_development_dependency 'debugger'
  gem.add_development_dependency 'rspec'
end
