require 'spec_helper'
module Nyulibraries
  module NyuCore
    describe Field do
      let(:name) { :subject }
      let(:value) { "NYUCore vs. NyuCore" }
      subject(:field) { Field.new(name: name, value: value) }
      it { should be_a(Field) }
      describe '#name=' do
        subject { field.name=(name) }
        context "when the name is passed as symbol" do
          let(:name) { :subject }
          it { should_not raise_error }
          it("should set the name to :subject") do
            expect(field.name).to be(:subject)
          end
        end
        context "when the name is passed as string" do
          let(:name) { "subject" }
          it { should_not raise_error }
          it("should set the name to :subject") do
            expect(field.name).to be(:subject)
          end
        end
      end
      describe '#name' do
        subject { field.name }
        context "when the name is passed as symbol" do
          let(:name) { "subject" }
          it { should be(:subject) }
        end
        context "when the name is passed as string" do
          let(:name) { "subject" }
          it { should be(:subject) }
        end
      end
    end
  end
end
