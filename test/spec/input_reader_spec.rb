require_relative 'spec_helper'

module Basic101

  describe InputReader do

    let(:input) {double Input, :read_line => line}
    subject(:input_reader) {described_class.new(input)}

    context 'invalid csv' do
      let(:line) {%Q'"abc'}
      specify do
        expect {
          input_reader
        }.to raise_error BadInputFormatError, "Invalid format"
      end
    end

    describe '#read_string' do

      context 'when unquoted' do
        let(:line) {%Q'abc,123'}
        specify do
          expect(input_reader.read_string).to eq 'abc'
        end
      end

      context 'with comma' do
        let(:line) {%Q'"abc,def",123'}
        specify do
          expect(input_reader.read_string).to eq 'abc,def'
        end
      end

      context 'with quote' do
        let(:line) {%Q'"abc""def",123'}
        specify do
          expect(input_reader.read_string).to eq 'abc"def'
        end
      end

      context 'when blank' do
        let(:line) {",abc"}
        specify do
          expect(input_reader.read_string).to eq ''
        end
      end

      context 'when end of line' do
        let(:line) {""}
        specify do
          expect(input_reader.read_string).to eq ''
        end
      end

      context 'when past end of line' do
        let(:line) {''}
        specify do
          input_reader.read_string
          expect {
            input_reader.read_string
          }.to raise_error TooFewInputItemsError, "Too few items"
        end
      end

    end

    describe '#read_numeric' do

      context 'when integer' do
        let(:line) {"123,abc"}
        specify do
          expect(input_reader.read_numeric).to eq 123
        end
      end

      context 'when positive integer' do
        let(:line) {"+123,abc"}
        specify do
          expect(input_reader.read_numeric).to eq 123
        end
      end

      context 'when negative integer' do
        let(:line) {"-123,abc"}
        specify do
          expect(input_reader.read_numeric).to eq -123
        end
      end

      context 'when float' do
        let(:line) {"1.2,abc"}
        specify do
          expect(input_reader.read_numeric).to be_within(0.000001).of(1.2)
        end
      end

      context 'when positive float' do
        let(:line) {"+1.2,abc"}
        specify do
          expect(input_reader.read_numeric).to be_within(0.000001).of(1.2)
        end
      end

      context 'when negative float' do
        let(:line) {"-1.2,abc"}
        specify do
          expect(input_reader.read_numeric).to be_within(0.000001).of(-1.2)
        end
      end

      context 'when not numeric' do
        let(:line) {"abc"}
        specify do
          expect {
            input_reader.read_numeric
          }.to raise_error BadInputFormatError, 'Not numeric: "abc"'
        end
      end

      context 'when blank' do
        let(:line) {",123"}
        specify do
          expect {
            input_reader.read_numeric
          }.to raise_error BadInputFormatError, 'Not numeric: ""'
        end
      end

      context 'whe end of line' do
        let(:line) {""}
        specify do
          expect {
            input_reader.read_numeric 
          }.to raise_error TooFewInputItemsError, "Too few items"
        end
      end

    end

  end

end
