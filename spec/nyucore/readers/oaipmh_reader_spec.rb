require 'spec_helper'
module NyuCore
  module Readers
    describe OAIPMHReader do
      context "when it's instaniated with a valid filename" do
        let(:support_directory) { File.expand_path('../../', __FILE__) + '/support' }
        let(:valid_oai_pmh_filename) { "#{support_directory}/readers/oaipmh.xml" }
        subject(:reader) { binding.pry; OAIPMHReader.new(valid_oai_pmh_filename) }
        it { should be_a(OAIPMHReader) }
        describe '#to_ary' do
          subject { reader.to_ary }
          it { should be_a(::NyuCore::Record) }
        end
      end
    end
  end
end
