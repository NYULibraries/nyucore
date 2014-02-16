require 'spec_helper'
module NyuCore
  describe Record do
    context "when the required fields are present" do
      let(:identity_fields) { Record::IDENTITY_FIELDS }
      let(:fields) do
        { "identifier" => 1234567890,
          "title" => "NYUCore/NyuCore",
          subject: "NYUCore vs. NyuCore" }
      end
      subject(:record) { Record.new(fields) }
      it { should be_a(Record) }
      it("should have identity fields") do
        expect(identity_fields).not_to be_empty
      end
      describe '#fields' do
        subject { record.fields }
        it { should be_a(Hash) }
        it("should have keys that are Symbols") do
          subject.each_key do |key|
            expect(key).to be_a(Symbol)
          end
        end
        it("should have single value fields that are NyuCore::Fields") do
          subject.each do |key, value|
            if identity_fields.include?(key)
              expect(value).to be_a(Field)
            end
          end
        end
        context "when the multivalue fields have single values" do
          it("should have multivalue fields that are Arrays containing 1 NyuCore::Field") do
            subject.each do |key, value|
              unless identity_fields.include?(key)
                expect(value).to be_an(Array)
                expect(value.size).to be(1)
                value.each { |field| expect(field).to be_a(Field) }
              end
            end
          end
        end
        context "when the multivalue fields have an Array of values" do
          let(:fields) do
            { "identifier" => 1234567890,
              "title" => "NYUCore/NyuCore",
              subject: ["NYUCore vs. NyuCore", "NYUCore's internal conflict"] }
          end
          it("should have multivalue fields that are Arrays containing multiple NyuCore::Fields") do
            subject.each do |key, value|
              unless identity_fields.include?(key)
                expect(value).to be_an(Array)
                expect(value.size).to be > 1
                value.each { |field| expect(field).to be_a(Field) }
              end
            end
          end
        end
      end
    end
    context "when a single value is passed in as an Array" do
      let(:invalid_fields) do
        { "identifier" => [1234567890, "0123456789"],
          "title" => "NYUCore/NyuCore",
          subject: "NYUCore vs. NyuCore" }
      end
      it("should raise an Argument Error") do
        expect{ Record.new(invalid_fields) }.to raise_error(ArgumentError)
      end
    end
    context "when some required fields are missing" do
      context "and it's the identifier that's missing" do
        let(:invalid_fields) do
          { "title" => "NYUCore/NyuCore",
            subject: "NYUCore vs. NyuCore" }
        end
        it("should raise an ArgumentError") do
          expect{ Record.new(invalid_fields) }.to raise_error(ArgumentError)
        end
      end
      context "and it's the title that's missing" do
        let(:invalid_fields) do
          { "identifier" => 1234567890,
            subject: "NYUCore vs. NyuCore" }
        end
        it("should raise an ArgumentError") do
          expect{ Record.new(invalid_fields) }.to raise_error(ArgumentError)
        end
      end
      context "and it's both the idenitifier and title that are missing" do
        let(:invalid_fields) do
          { subject: "NYUCore vs. NyuCore" }
        end
        it("should raise an ArgumentError") do
          expect{ Record.new(invalid_fields) }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
