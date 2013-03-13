# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'devbar/version'

Gem::Specification.new do |gem|
  gem.name          = "devbar"
  gem.version       = Devbar::VERSION
  gem.authors       = ["John Beynon"]
  gem.email         = ["john@beynon.org.uk"]
  gem.description   = %q{ Rack middleware to output a bar showing environment }
  gem.summary       = %q{ Middleware to show what env your app is running in }
  gem.homepage      = "http://github.com/johnbeynon/devbar"

  gem.files         = `git ls-files`.split($/)
  gem.require_paths = ["lib"]
end
