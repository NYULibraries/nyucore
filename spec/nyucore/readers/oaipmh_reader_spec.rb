require 'spec_helper'
module NyuCore
  module Readers
    describe OAIPMHReader do
      let(:support_directory) { File.expand_path('../../', __FILE__) + '/support' }
      context "when it's instaniated with a valid filename" do
        let(:valid_oai_pmh_filename) { "#{support_directory}/readers/oaipmh.xml" }
        subject(:reader) { OAIPMHReader.new(valid_oai_pmh_filename) }
        it { should be_a(OAIPMHReader) }
        describe '#to_ary' do
          subject(:records) { reader.to_ary }
          it { should be_a(Array) }
          it { should_not be_empty }
          it("should have 3 elements") do
            expect(records.size).to be(3)
          end
          it("should have NyuCore::Records as elements") do
            records.each do |record|
              expect(record).to be_an(::NyuCore::Record)
            end
          end
        end
      end
      context "when it's instaniated with a invalid filename" do
        let(:invalid_oai_pmh_filename) { "#{support_directory}/readers/invalid.xml" }
        it("should raise an ArgumentError") do
          expect { OAIPMHReader.new(invalid_oai_pmh_filename) }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
