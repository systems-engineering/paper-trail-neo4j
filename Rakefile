require 'rubygems'
require 'rake'
require 'rake/clean'
require 'bundler'

NAME = 'paper-trail-neo4j'.freeze
VERSION = lambda do
  require File.expand_path('lib/paper-trail-neo4j', __dir__)
  PaperTrailNeo4j::VERSION_NUMBER
end

# Gem packaging
desc 'Build the gem'
task package: [:clean] do
  sh %(#{FileUtils::RUBY} -S gem build paper-trail-neo4j.gemspec)
end

desc 'Publish the gem to rubygems.org'
task release: [:package] do
  sh %(#{FileUtils::RUBY} -S gem push ./#{NAME}-#{VERSION_NUMBER.call}.gem)
end
