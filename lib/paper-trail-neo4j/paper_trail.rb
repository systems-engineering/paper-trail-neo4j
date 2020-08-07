# frozen_string_literal: true

require 'paper-trail-neo4j/helper'

module PaperTrailNeo4j
  module PaperTrail
    extend ActiveSupport::Concern

    included do
      class_eval do
        has_many :out, :versions,
                 type: :versioned_by,
                 model_class: 'PaperTrailNeo4j::Version'
      end

      after_create do
        object_changes = attributes.transform_values { |v| [nil, v] }

        attrs = {
          object_id: id,
          event: :create,
          object_changes: object_changes.to_json,
          object: nil
        }

        PaperTrailNeo4j::Helper.create_version self, attrs
      end

      before_update do
        if changes.any?
          attrs = {
            object_id: id,
            event: :update,
            object_changes: changes.to_json,
            object: attributes.merge(changed_attributes).to_json
          }

          PaperTrailNeo4j::Helper.create_version self, attrs
        end
      end

      after_destroy do
        attrs = {
          object_id: id,
          event: :destroy,
          object_changes: nil,
          object: attributes.to_json
        }

        PaperTrailNeo4j::Helper.create_version self, attrs
      end
    end
  end
end
