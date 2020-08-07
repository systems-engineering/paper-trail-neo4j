# frozen_string_literal: true

require 'neo4j'

module PaperTrailNeo4j
  class Version
    include ::Neo4j::ActiveNode

    property :object_id,
             type: String

    property :event,
             type: String

    property :object_changes,
             type: String

    property :object,
             type: String

    property :object_type,
             type: String

    property :transaction_id,
             type: String

    property :whodunnit,
             type: String

    property :metadata,
             type: String

    property :created_at,
             type: String

    has_one :in, :item,
            type: :versioned,
            model_class: false
  end
end
