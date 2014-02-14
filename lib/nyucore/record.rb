module NyuCore
  class Record
    REQUIRED_FIELDS = [:identifier, :title]
    attr_accessor :fields

    def initialize(fields = {})
      required_fields_present = []
      @fields = {}
      fields.each do |key, value|
        required_fields_present << key.to_sym if REQUIRED_FIELDS.include?(key.to_sym)
        field = Field.new(name: key, value: value)
        @fields[field.name] = field
      end
      required_fields_missing = REQUIRED_FIELDS - required_fields_present
      unless required_fields_missing.empty?
        raise ArgumentError.new("Missing required fields: #{required_fields_missing}") 
      end
    end
  end
end
