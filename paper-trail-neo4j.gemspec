# frozen_string_literal: true

begin
  require './lib/paper-trail-neo4j/version_number'
rescue LoadError
  module PaperTrailNeo4j; VERSION_NUMBER = '0'; end
end

Gem::Specification.new do |spec|
  spec.name          = 'paper-trail-neo4j'
  spec.version       = PaperTrailNeo4j::VERSION_NUMBER
  spec.authors       = ['Wojciech Maciejak']
  spec.email         = 'wojciech@maciejak.eu'
  spec.summary       = 'Paper Trail alternative for Neo4j.rb'
  spec.homepage      = 'https://github.com/systems-engineering/paper-trail-neo4j'
  spec.license       = 'MIT'

  spec.require_paths = ['lib']
  spec.files         = Dir.glob('{bin,lib}/**/*') + \
                       %w[README.md CHANGELOG.md]

  spec.add_runtime_dependency 'neo4j', '~> 9.6'
  spec.add_runtime_dependency 'request_store', '~> 1.1'
  spec.add_runtime_dependency 'activesupport', '~> 6.0'
  spec.add_runtime_dependency 'rake', '~> 13.0'

  spec.add_development_dependency 'rspec', '~> 3.9'
end
