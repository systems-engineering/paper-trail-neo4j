# PaperTrail for Neo4j

This is a light implementation of the [PaperTrail gem](https://github.com/paper-trail-gem/paper_trail) for the Neo4j graph database.

**What does light implementation mean?** That is an excellent question. It means that we absolutely don't have all the features build in. This was born from a need for the paper trail functionality, but for a database build on fundamentally very different principles. This means that it's not simple to copy-and-paste the functionality.

**Will there be more functionality in the future?** Yes. For now we have build the functionality that we _need_. But we're absolutely interested in improving this gem, so feel free to open [issues](https://github.com/systems-engineering/paper-trail-neo4j/issues) and [PRs](https://github.com/systems-engineering/paper-trail-neo4j/pulls) with features, improvements, and bugs.

## Usage

So, on to how to use it.

```ruby
gem 'paper-trail-neo4j
```
