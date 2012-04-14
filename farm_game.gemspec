# -*- encoding: utf-8 -*-
require File.expand_path('../lib/farm_game/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Ben Langfeld", "Simon Murphy"]
  gem.email         = ["ben@langfeld.me", "me@simonmurphy.info"]
  gem.description   = %q{Buy livestock and produce, sell them at market, successfully breed your animals and purchase upgrades for your farm in order to get ahead in this exciting experience in farm management.}
  gem.summary       = %q{A fun game where you make a fortune through clever farm management.}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "farm_game"
  gem.require_paths = ["lib"]
  gem.version       = FarmGame::VERSION

  gem.add_development_dependency 'bundler', ["~> 1.0"]
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', ["~> 2.7"]
  gem.add_development_dependency 'ruby_gntp'
  gem.add_development_dependency 'yard'
end
