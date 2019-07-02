# Dummy class that defines a few ActiveRecord methods
class Dummy
  DEFAULT_ID = 661640424745861929

  attr_reader :id

  delegate :dogtag_data_type, to: :class

  class << self
    def dogtag_data_type
      0
    end

    def valid_instance
      new DEFAULT_ID
    end

    def find(id)
      return new(id) if id == DEFAULT_ID

      raise StandardError
    end

    def find_by(id:)
      id == DEFAULT_ID ? new(id) : nil
    end

    def exists?(id)
      id == DEFAULT_ID
    end
  end

  def initialize(id)
    @id = id
  end

  def ==(other)
    other.instance_of?(Dummy) && other.id == id
  end
end
