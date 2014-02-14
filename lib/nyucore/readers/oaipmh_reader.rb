module NyuCore
  module Readers
    require 'multi_xml'
    class OAIPMHReader
      def initialize(input)
        @input = input
        unless File.exists?(input)
          raise ArgumentError.new("File doesn't exist: #{input}")
        end
      end

      def to_ary
        @records = []
        # Parse the files into a hash
        xml = MultiXml.parse(input_file.read)
        oaipmh_records = xml["OAI_PMH"]["ListRecords"]["record"]
        unless oaipmh_records.nil?
          oaipmh_records.each do |oaipmh_record|
            oaipmh_header = oaipmh_record["header"]
            identifier = identifier(oaipmh_header) if oaipmh_header
            oaipmh_metadata = oaipmh_record["metadata"]
          end
        end
        @records
      end

      def identifier(oaipmh_header)
        # Clean up the identifiers
        # Remove http://
        # Replace dots(.), slashes(/) and double backslashes(\\) 
        # with dashes(-)
        oaipmh_header["identifier"].gsub('http://', '').gsub(/(.|\\|\/)/, '-')
      end
      private :identifier

      def input_file
        File.new(@input)
      end
      private :input_file
    end
  end
end