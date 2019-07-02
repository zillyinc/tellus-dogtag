# frozen_string_literal: true

module Tellus
  module Dogtag
    # Dogtag data types, generally provided by clients in an initializer
    class DataType
      class << self
        attr_accessor :data_types
      end
    end
  end
end
