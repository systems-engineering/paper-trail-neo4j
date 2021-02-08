# frozen_string_literal: true

require "neo4j_ruby_driver"
require "active_graph"

module PaperTrailNeo4j
  class Version
    include ::ActiveGraph::Node

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
