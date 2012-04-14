#!/usr/bin/env rake
require 'bundler/gem_tasks'

require 'bundler/setup'

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.ruby_opts = "-w"
end

task :default => :spec

require 'yard'
YARD::Rake::YardocTask.new
