module Nyulibraries
  module NyuCore
    class Field
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
        @name = name.to_sym
      end
    end
  end
end
