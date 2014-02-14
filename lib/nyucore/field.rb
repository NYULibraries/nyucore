module NyuCore
  class Field
    NYU_NAMES = [:access_url, :archive_url, :vernacular, :uniform, :collection_id,
      :isbn, :issn, :genre, :classification, :full_text]
    DC_NAMES = [:identifier, :title, :type, :creator, :contributor,
      :date, :publisher, :format, :description, :rights]
    DCTERMS_NAMES = [:alternative, :is_part_of, :subject, :modified,
      :language, :coverage, :spatial, :temporal, :extent, :abstract]
    VALID_NAMES = NYU_NAMES + DC_NAMES + DCTERMS_NAMES

    attr_accessor :name, :value

    # Initialize with a Hash of attributes
    #   e.g. Nyulibraries::NyuCore::Field.new(name: :subject:, value: "NYUCore vs. NyuCore")
    #
    # Valid keys are :name, :value.
    # Name can be passed either as a string or a symbol.
    # They will be converted to a symbol.
    #   e.g. the following are equivalent
    #     Nyulibraries::NyuCore::Field.new(name: :subject, value: "NYUCore vs. NyuCore")
    #     Nyulibraries::NyuCore::Field.new(name: "subject", value: "NYUCore vs. NyuCore")
    def initialize(attributes = {})
      self.name = attributes[:name]
      @value = attributes[:value]
    end

    def name=(name)
      symbolized_name = name.to_sym
      unless VALID_NAMES.include?(symbolized_name)
        raise ArgumentError.new("Invalid field name!")
      end
      @name = symbolized_name
    end

    def namespace
      @namespace ||= case name
        when *NYU_NAMES
          :nyu
        when *DC_NAMES
          :dc
        when *DCTERMS_NAMES
          :dcterms
        end
    end
    alias_method :prefix, :namespace
  end
end
