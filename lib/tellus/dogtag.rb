# frozen_string_literal: true

require 'tellus/dogtag/version'

module Tellus
  # Utilities for using Dogtag with ActiveRecord
  module Dogtag
    class << self
      def data_types
        DataType.data_types
      end

      # Get the data type for a given model name
      def data_type_for(model_name)
        data_types[model_name]
      end

      # Uses find_by, returns nil if not found
      def find(id)
        model_from(id)&.find_by(id: id)
      end

      # Find or raise ActiveRecord::RecordNotFound. Will return nil if the ID
      # is invalid.
      def find!(id)
        model_from(id)&.find(id)
      end

      # checks if the given ID exists in the database
      def exists?(id)
        model_from(id)&.exists?(id) || false
      end

      def model_from(id)
        data_types.key(data_type_from(id))&.constantize
      end

      def data_type_from(id)
        ::Dogtag::Id.new(id).data_type
      end
    end
  end
end

require 'tellus/dogtag/has_dogtag_id'
require 'tellus/dogtag/data_type'
require 'active_support/inflector'
require 'dogtag'
