module NyuCore
  class Record
    REQUIRED_FIELDS = [:identifier, :title]
    # Identity fields can only have a single value, everything else 
    # can have multiple values
    IDENTITY_FIELDS = [:identifier, :title, :creator, :publisher, :type]
    attr_reader :fields

    def initialize(fields = {})
      @fields = {}
      fields.each do |key, value|
        @fields[key.to_sym] = IDENTITY_FIELDS.include?(key.to_sym) ? 
          new_field(key, value) : [new_field(key, value)].flatten
      end
      # Check for missing required fiexlds
      raise_error_if_missing_required_fields
      # Check for ambiguous "identity" fields
      raise_error_if_ambiguous_identity_fields
    end

    def raise_error_if_missing_required_fields
      missing_required_fields = (REQUIRED_FIELDS - @fields.keys)
      unless missing_required_fields.empty?
        raise ArgumentError.new("Missing required fields: #{missing_required_fields}")
      end
    end
    private :raise_error_if_missing_required_fields

    def raise_error_if_ambiguous_identity_fields
      ambiguous_identity_fields =
        IDENTITY_FIELDS.select{ |key| @fields[key].is_a? Array }
      unless ambiguous_identity_fields.empty?
        raise ArgumentError.new("Ambiguous identity fields: #{ambiguous_identity_fields}")
      end
    end
    private :raise_error_if_ambiguous_identity_fields

    def new_field(key, value)
      if value.is_a? Array
        value.map { |new_value| new_field(key, new_value) }
      else
        Field.new(name: key, value: value)
      end
    end
    private :new_field
  end
end
