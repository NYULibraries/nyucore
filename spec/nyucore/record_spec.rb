require 'spec_helper'
module NyuCore
  describe Record do
    let(:fields) do
      { 
        "identifier" => 1234567890,
        "title" => "NYUCore/NyuCore",
        subject: "NYUCore vs. NyuCore"
      }
    end
    context "when the required fields are present" do
      subject(:record) { Record.new(fields) }
      it { should be_a(Record) }

      describe '#fields' do
        subject { record.fields }
        it { should be_a(Hash) }
        it("should have keys that are Symbols") do
          subject.each_key do |key|
            expect(key).to be_a(Symbol)
          end
        end
        it("should have values that are NyuCore::Fields") do
          subject.each_value do |field|
            expect(field).to be_a(Field)
          end
        end
      end
    end
    context "when some required fields are missing" do
      context "and it's the identifier that's missing" do
        let(:invalid_fields) do
          { 
            "title" => "NYUCore/NyuCore",
            subject: "NYUCore vs. NyuCore"
          }
        end
        it("should raise an ArgumentError") do
          expect{ Record.new(invalid_fields) }.to raise_error(ArgumentError)
        end
      end
      context "and it's the title that's missing" do
        let(:invalid_fields) do
          { 
            "identifier" => 1234567890,
            subject: "NYUCore vs. NyuCore"
          }
        end
        it("should raise an ArgumentError") do
          expect{ Record.new(invalid_fields) }.to raise_error(ArgumentError)
        end
      end
      context "and it's both the idenitifier and title that are missing" do
        let(:invalid_fields) do
          { 
            subject: "NYUCore vs. NyuCore"
          }
        end
        it("should raise an ArgumentError") do
          expect{ Record.new(invalid_fields) }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
