require 'spec_helper'
module NyuCore
  describe Record do
    let(:attributes) do
      { 
        subject: "NYUCore vs. NyuCore", 
        "identifier" => 1234567890
      }
    end
    subject(:record) { Record.new(attributes) }
    it { should be_a(Record) }

    describe '#fields' do
      subject(:fields) { record.fields }
      it { should be_a(Hash) }
      it("should have keys that are Symbols") do
        fields.each_key do |key|
          expect(key).to be_a(Symbol)
        end
      end
      it("should have values that are NyuCore::Fields") do
        fields.each_value do |field|
          expect(field).to be_a(Field)
        end
      end
    end
  end
end
