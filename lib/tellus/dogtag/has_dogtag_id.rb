# frozen_string_literal: true

require 'active_support/concern'

module Tellus
  module Dogtag
    # concern for models that should have a Dogtag ID
    module HasDogtagId
      extend ActiveSupport::Concern

      included do
        before_create :set_dogtag_id

        delegate :dogtag_data_type, to: :class

        def self.dogtag_data_type
          Tellus::Dogtag.data_type_for(name.to_s)
        end
      end

      private

      def set_dogtag_id
        self.id ||= ::Dogtag.generate_id(self.class.dogtag_data_type)
      end
    end
  end
end
