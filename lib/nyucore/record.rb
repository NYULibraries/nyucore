module NyuCore
  class Record
    attr_accessor :fields

    def initialize(attributes = {})
      @fields = {}
      attributes.each do |key, value|
        field = Field.new(name: key, value: value)
        @fields[field.name] = field
      end
    end
  end
end
