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
  gem.homepage      = "http://github.com/johnbeynon/devbar"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
