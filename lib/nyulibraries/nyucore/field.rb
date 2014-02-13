module Nyulibraries
  module NyuCore
    class Field
      NAMES = [:identifier, :accessURL, :archiveURL, :title, :alternative,
        :vernacular, :uniform, :type, :isPartOf, :collectionId, :creator,
        :contributor, :ISBN, :ISSN, :subject, :genre, :classification, :date,
        :modified, :publisher, :language, :coverage, :spatial, :temporal,
        :extent, :format, :description, :abstract, :fullText, :rights]

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
        unless NAMES.include?(symbolized_name)
          raise ArgumentError.new("Invalid name!")
        end
        @name = symbolized_name
      end
    end
  end
end
