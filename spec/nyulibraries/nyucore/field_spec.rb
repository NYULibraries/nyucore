require 'spec_helper'
module Nyulibraries
  module NyuCore
    describe Field do
      let(:value) { "NYUCore vs. NyuCore" }
      context "when the instantiation name attribute is valid" do
        let(:name) { :subject }
        subject(:field) { Field.new(name: name, value: value) }
        it { should be_a(Field) }
        describe '#name=' do
          context "when the name is valid" do
            subject { field.name=(new_name) }
            context "and passed as symbol" do
              let(:new_name) { :subject }
              it("should set the name to :subject") do
                expect(field.name).to be(:subject)
              end
            end
            context "and passed as string" do
              let(:new_name) { "subject" }
              it("should set the name to :subject") do
                expect(field.name).to be(:subject)
              end
            end
          end
          context "when the name is invalid" do
            it("should raise an ArgumentError") do
              expect{ field.name=(:invalid) }.to raise_error(ArgumentError)
            end
          end
        end
        describe '#name' do
          subject { field.name }
          context "when the name is valid" do
            context "and is passed as symbol" do
              let(:name) { "subject" }
              it { should be(:subject) }
            end
            context "and is passed as string" do
              let(:name) { "subject" }
              it { should be(:subject) }
            end
          end
        end
      end
      context "when the instantiation name attribute is invalid" do
        it("should raise an ArgumentError") do
          expect{ Field.new(name: :invalid, value: value) }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
