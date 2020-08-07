# frozen_string_literal: true

require 'paper-trail-neo4j/request'
require 'paper-trail-neo4j/version'

module PaperTrailNeo4j
  module Helper
    def self.create_version(model, attrs)
      default_attrs = {
        object_type: model.class.name.to_s,
        created_at: Time.now.utc.iso8601,
        transaction_id: nil,
        whodunnit: PaperTrailNeo4j::Request.whodunnit.to_s,
        metadata: PaperTrailNeo4j::Request.controller_info.to_json
      }

      version = PaperTrailNeo4j::Version.create default_attrs.merge attrs

      model.versions << version
    end
  end
end
