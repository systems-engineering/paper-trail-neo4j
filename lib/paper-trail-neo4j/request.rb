# frozen_string_literal: true

require 'request_store'

module PaperTrailNeo4j
  module Request
    class << self
      # Sets any data from the controller that you want PaperTrail to store.
      # See also `PaperTrail::Rails::Controller#info_for_paper_trail`.
      #
      #   PaperTrail::Request.controller_info = { ip: request_user_ip }
      #   PaperTrail::Request.controller_info # => { ip: '127.0.0.1' }
      #
      # @api public
      def controller_info=(value)
        store[:controller_info] = value
      end

      # Returns the data from the controller that you want PaperTrail to store.
      # See also `PaperTrail::Rails::Controller#info_for_paper_trail`.
      #
      #   PaperTrail::Request.controller_info = { ip: request_user_ip }
      #   PaperTrail::Request.controller_info # => { ip: '127.0.0.1' }
      #
      # @api public
      def controller_info
        store[:controller_info]
      end

      # Sets who is responsible for any changes that occur during request. You
      # would normally use this in a migration or on the console, when working
      # with models directly.
      #
      # `value` is usually a string, the name of a person, but you can set
      # anything that responds to `to_s`. You can also set a Proc, which will
      # not be evaluated until `whodunnit` is called later, usually right before
      # inserting a `Version` record.
      #
      # @api public
      def whodunnit=(value)
        store[:whodunnit] = value
      end

      # Returns who is reponsible for any changes that occur during request.
      #
      # @api public
      def whodunnit
        who = store[:whodunnit]
        who.respond_to?(:call) ? who.call : who
      end

      private

      # Returns a Hash, initializing with default values if necessary.
      # @api private
      def store
        RequestStore.store[:paper_trail] ||= {
          enabled: true
        }
      end
    end
  end
end
